<?php

	/**
	 * контроллер SiteController
	*/
class SiteController
{

	/**
	 * Action для главной страницы
	*/
	public function actionIndex($page=1)
	{

		// Список категорий для левого меню
		$categories = array();
		$categories = Category::getCategoriesList();

		// Список последних товаров
		$latestProducts = array();
		$latestProducts = Product::getLatestProducts(6, $page);
		
		// Количество всех товаров на сайте (необходимо для постраничной навигации)
		$total = Product::getTotalProducts();
		
		// Создаем объект Pagination - постраничная навигация
		$pagination = new Pagination($total, $page, Product::SHOW_BY_DEFAULT, 'page-');

		// Список товаров для слайдера
		$sliderProducts = Product::getRecommendedProducts();

		// Подключаем вид
		if (empty($latestProducts)) {
			require_once(ROOT . '/views/404/404.php');
		} else {
			require_once(ROOT . '/views/site/index.php');
		}

		return true;
	}

		/**
		* Action для страницы "Контакты"
		*/
		public function actionContact() {

			// Переменные для формы
			$userEmail = false;
			$userText = false;
			$result = false;

			// Обработка формы
			if (isset($_POST['submit'])) {
				// Если форма отправлена
				// Получаем данные из формы
				$userEmail = $_POST['userEmail'];
				$userText = $_POST['userText'];

				// Флаг ошибок
				$errors = false;

				// Валидация полей
				if (!User::checkEmail($userEmail)) {
					$errors[] = 'Неправильный email';
				}
				if ($errors == false) {
					// Если ошибок нет
					// Отправляем письмо администратору
					$adminEmail = 'nicon-83@mail.ru';
					$message = "Текст: {$userText}. От {$userEmail}";
					$subject = 'Тема письма';    
					$result = mail($adminEmail, $subject, $message);
					$result = true;
				}

			}

			// Подключаем вид
			require_once(ROOT . '/views/site/contact.php');

			return true;
		}

	/**
	 * Action для страницы "О магазине"
	 */
	public function actionAbout()
	{
		// Подключаем вид
		require_once(ROOT . '/views/site/about.php');
		return true;
	}

}
