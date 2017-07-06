<?php

/**
 * Контроллер CatalogController
 * Каталог товаров
 */
class CatalogController
{

	/**
	 * Action для страницы "Каталог товаров"
	 */
	public function actionIndex($page=1)
	{
		// Список категорий для левого меню
		$categories = array();
		$categories = Category::getCategoriesList();

		// Список последних товаров
		$latestProducts = array();
		$latestProducts = Product::getLatestProducts(12, $page);

		// Количество всех товаров на сайте (необходимо для постраничной навигации)
		$total = Product::getTotalProducts();

		// Создаем объект Pagination - постраничная навигация
		$pagination = new Pagination($total, $page, 12, 'page-');

		// Подключаем вид
		if (empty($latestProducts)) {
			require_once(ROOT . '/views/404/404.php');
		} else {
			require_once(ROOT . '/views/catalog/index.php');
		}

		return true;
	}

	/**
	 * Action для страницы "Категория товаров"
	 */
	public function actionCategory($categoryId, $page = 1)
	{
		// Список категорий для левого меню
		$categories = array();
		$categories = Category::getCategoriesList();

		// Список товаров в категории
		$categoryProducts = array();
		$categoryProducts = Product::getProductsListByCategory($categoryId, $page);

		// Общее количество товаров (необходимо для постраничной навигации)
		$total = Product::getTotalProductsInCategory($categoryId);

		// Создаем объект Pagination - постраничная навигация
		$pagination = new Pagination($total, $page, Product::SHOW_BY_DEFAULT, 'page-');

		// Подключаем вид
		if (empty($categoryProducts)) {
			require_once(ROOT . '/views/404/404.php');
		} else {
			require_once(ROOT . '/views/catalog/category.php');
		}

		return true;
	}

}
