<?php

/**
 * Контроллер ProductController
 * Товар
 */
class ProductController
{

    /**
     * Action для страницы просмотра товара
     * @param integer $productId <p>id товара</p>
     */
	public function actionView($productId)
	{
		// Список категорий для левого меню
		$categories = array();
		$categories = Category::getCategoriesList();

		// Получаем информацию о товаре
		$product = Product::getProductById($productId);

		// Подключаем вид
		if(!empty($product)){
			require_once(ROOT . '/views/product/view.php');
		} else {
			require_once(ROOT . '/views/404/404.php');
		}

		return true;
	}

}
