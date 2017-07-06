<?php

/**
 * Контроллер AdminController
 * Главная страница в админпанели
 */
class AdminController extends AdminBase
{
	/**
	 * Action для стартовой страницы "Панель администратора"
	 */
	public function actionIndex()
	{

		// Проверяем авторизирован ли пользователь. Если нет, он будет переадресован
		$userId = User::checkLogged();

		// Получаем информацию о текущем пользователе
		$user = User::getUserById($userId);

		// Проверка доступа
		self::checkAdmin();

		// Подключаем вид
		require_once(ROOT . '/views/admin/index.php');
		return true;
	}

}
