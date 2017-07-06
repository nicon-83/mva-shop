<?php

/**
 * Класс Router
 * Компонент для работы с маршрутами
 */
class Router
{

	/**
	 * Свойство для хранения массива роутов
	 * @var array 
	 */
	private $routes;

	/**
	 * Конструктор
	 */
	public function __construct()
	{
		// Путь к файлу с роутами
		$routesPath = ROOT . '/config/routes.php';

		// Получаем роуты из файла
		$this->routes = include($routesPath);
	}

	/**
	 * Возвращает строку запроса
	 */
	private function getURI()
	{
		if (!empty($_SERVER['REQUEST_URI'])) {
			return trim($_SERVER['REQUEST_URI'], '/');
		}
	}

	/**
	 * Метод для обработки запроса
	 */
	public function run()
	{
		// Получаем строку запроса
		$uri = $this->getURI();


		// Проверяем наличие такого запроса в массиве маршрутов (routes.php)
		foreach ($this->routes as $uriPattern => $path) {

			// Сравниваем $uriPattern и $uri
			if (preg_match("~$uriPattern~", $uri)) {

				// Получаем внутренний путь из внешнего согласно правилу.
				$internalRoute = preg_replace("~$uriPattern~", $path, $uri);

				// Определяем контроллер, action, параметры

				$segments = explode('/', $internalRoute);

				$controllerName = array_shift($segments) . 'Controller';
				$controllerName = ucfirst($controllerName);

				$actionName = 'action' . ucfirst(array_shift($segments));

				$parameters = $segments;

				// Подключаем файл класса-контроллера
				$controllerFile = ROOT . '/controllers/' .
				$controllerName . '.php';

				if (file_exists($controllerFile)) {
					include_once($controllerFile);
				}

				// Создаем новый объект необходимого класса
				$controllerObject = new $controllerName;

				/* Вызываем необходимый метод ($actionName) у определенного 
				 * класса ($controllerObject) с заданными ($parameters) параметрами
				 *
				 * Проверяем - если метод у объекта существует, то вызываем его,
				 * Если нет - выдаем страницу 404
				 */
				if(method_exists($controllerObject, $actionName)){
					$result = call_user_func_array(array($controllerObject, $actionName), $parameters);

					// Если метод контроллера успешно вызван, завершаем работу роутера
					if ($result != null) {
						break;
					}

				} else {
					require_once(ROOT . '/views/404/404.php');
					break;
				}

			}
		}
	}

}
