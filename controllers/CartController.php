<?php

/**
 * Контроллер CartController
 * Корзина
 */
class CartController
{

	/**
	 * Action для добавления товара в корзину синхронным запросом<br/>
	 * (не используется)
	 * @param integer $id <p>id товара</p>
	 */
	public function actionAdd($id)
	{
		// Добавляем товар в корзину
		if(Product::getProductById($id)){
		// Предварительно проверяем существует ли товар с указанным id
			Cart::addProduct($id);

		// Возвращаем пользователя на страницу с которой он пришел
			$referrer = $_SERVER['HTTP_REFERER'];
			header("Location: $referrer");
		} else {
			// если товар не существует выдаем ошибку 404 - защита от удаления через адресную строку
			return require_once(ROOT . '/views/404/404.php');
		}
	}

	/**
	 * Action для добавления товара в корзину при помощи асинхронного запроса (ajax)
	 * @param integer $id <p>id товара</p>
	 */
	public function actionAddAjax($id)
	{

		// Добавляем товар в корзину
		if(Product::getProductById($id)){
		//Предварительно проверяем существует ли товар с указанным id
			echo Cart::addProduct($id);
			return true;
		} else {
			return require_once(ROOT . '/views/404/404.php');
		}
	}


	/**
	 * Action для удаления товара из корзины
	 * @param integer $id <p>id товара</p>
	 */
	public function actionDelete($id)
	{
		// Удалить товар из корзины
		Cart::deleteProduct($id);

		// Возвращаем пользователя на страницу
		header("Location: /cart/");
	}

	/**
	 * Action для страницы "Корзина"
	 */
	public function actionIndex()
	{

		// Список категорий для левого меню
		$categories = array();
		$categories = Category::getCategoriesList();

		$productsInCart = false;

		// Получим идентификаторы и количество товаров в корзине
		$productsInCart = Cart::getProducts();

		if ($productsInCart) {
			// Если в корзине есть товары, получаем полную информацию о товарах для списка
			// Получаем массив только с идентификаторами товаров
			$productsIds = array_keys($productsInCart);

			// Получаем массив с полной информацией о необходимых товарах
			$products = Product::getProductsByIds($productsIds);

			// Получаем общую стоимость товаров
			$totalPrice = Cart::getTotalPrice($products);
		}

		// Подключаем вид
		require_once(ROOT . '/views/cart/index.php');

		return true;
	}

	/**
	 * Action для страницы "Оформление покупки"
	 */
	public function actionCheckout()
	{

		// Получием данные из корзины
		$productsInCart = Cart::getProducts();

		// Если товаров нет, отправляем пользователи искать товары на главную
		if ($productsInCart == false) {
			header("Location: /");
		}

		// Список категорий для левого меню
		$categories = Category::getCategoriesList();

		// Находим общую стоимость
		$productsIds = array_keys($productsInCart);
		$products = Product::getProductsByIds($productsIds);
		$totalPrice = Cart::getTotalPrice($products);

		// Количество товаров
		$totalQuantity = Cart::countItems();

		// Поля для формы
		$userName = false;
		$userPhone = false;
		$userComment = false;

		// Статус успешного оформления заказа
		$result = false;

		// Проверяем является ли пользователь гостем
		if (!User::isGuest()) {
			// Если пользователь не гость
			// Получаем информацию о пользователе из БД
			$userId = User::checkLogged();
			$user = User::getUserById($userId);
			$userName = $user['name'];
		} else {
			// Если гость, поля формы останутся пустыми
			$userId = 1;
		}

		// Обработка формы
		if (isset($_POST['submit'])) {
			// Если форма отправлена
			// Получаем данные из формы
			$userName = $_POST['userName'];
			$userPhone = $_POST['userPhone'];
			$userComment = $_POST['userComment'];

			// Флаг ошибок
			$errors = false;

			// Валидация полей
			if (!User::checkName($userName)) {
				$errors[] = 'Неправильное имя';
			}
			if (!User::checkPhone($userPhone)) {
				$errors[] = 'Неправильный телефон';
			}


			if ($errors == false) {
				// Если ошибок нет
				// Сохраняем заказ в базе данных
				$result = Order::save($userName, $userPhone, $userComment, $userId, $productsInCart);

				if ($result) {
					// Если заказ успешно сохранен
					// Оповещаем администратора о новом заказе по почте
					$adminEmail = 'php.start@mail.ru';
					$message = '<a href="http://.../admin/orders">Список заказов</a>';
					$subject = 'Новый заказ!';
					mail($adminEmail, $subject, $message);

					// Очищаем корзину
					Cart::clear();
				}
			}
		}

		// Подключаем вид
		require_once(ROOT . '/views/cart/checkout.php');

		return true;
	}

}
