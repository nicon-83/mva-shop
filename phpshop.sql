-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 05 2017 г., 16:02
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `phpshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `sort_order`, `status`) VALUES
(1, 'Ноутбуки', 1, 1),
(2, 'Планшеты', 2, 1),
(3, 'Мониторы', 3, 1),
(4, 'Игровые компьютеры', 4, 1),
(5, 'Смартфоны', 5, 1),
(6, 'Телевизоры', 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `price` float NOT NULL,
  `availability` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `is_recommended` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `code`, `price`, `availability`, `brand`, `description`, `is_new`, `is_recommended`, `status`) VALUES
(1, 'Lenovo ZUK Z1 3/64GB Grey', 5, 1838726, 610, 1, 'Lenovo', 'Экран (5.5", IPS, 1920x1080)/ Qualcomm Snapdragon 801 (2.5 ГГц)/ основная камера: 13 Мп, фронтальная камера: 8 Мп/ RAM 3 ГБ/ 64 ГБ встроенной памяти/ 3G/ LTE/ GPS/ поддержка 2х SIM-карт (Nano-SIM)/ Android 5.1.1 (Lollipop) / 4100 мА*ч', 0, 0, 1),
(2, 'Asus ZenFone 2 32GB (ZE551ML) Gold', 5, 1834623, 430, 1, 'Asus', 'Экран (5.5", IPS, 1920x1080)/ Intel Atom Z3580 (2.3 ГГц)/ основная камера: 13 Мп, фронтальная камера: 5 Мп/ RAM 4 ГБ/ 32 ГБ встроенной памяти + microSD/SDHC (до 64 ГБ)/ 3G/ LTE/ GPS/ поддержка 2х SIM-карт (Micro-SIM)/ Android 5.0 (Lollipop) / 3000 мА*ч', 0, 0, 1),
(3, 'HTC One X10 Dual Sim Black', 5, 1834973, 690, 1, 'HTC', 'Экран (5.5", Super LCD, 1920x1080)/ Mediatek Helio P10 (1.8 ГГц + 1.0 ГГц)/ основная камера: 16 Мп, фронтальная камера: 8 Мп/ RAM 3 ГБ/ 32 ГБ встроенной памяти + microSD/SDHC (до 2 ТБ)/ 3G/ GPS/ ГЛОНАСС/поддержка 2х SIM-карт (Nano-SIM)/ Android M с HTC Sense 8/ 4000 мА*ч', 0, 0, 1),
(4, 'Apple iPhone 6s 32GB Rose Gold', 5, 1837634, 456, 1, 'Apple', 'Экран (4.7", IPS, 1334x750)/ Apple A9 (1.8 ГГц)/ основная камера: 12 Мп, фронтальная камера: 5 Мп/ RAM 2 ГБ/ 32 ГБ встроенной памяти/ 3G/ LTE/ GPS/ Nano-SIM/ iOS 9/', 0, 1, 1),
(10, 'Samsung UE43KU6000UXUA', 6, 1839645, 1325, 1, 'Samsung', 'Диагональ экрана: 43"\r\nРазрешение: 3840x2160\r\nДиапазоны цифрового тюнера: DVB-S2, DVB-C, DVB-T2\r\n    Smart-платформа: Tizen\r\n    Частота обновления: 1300 Гц (PQI)\r\n    Подробнее: http://rozetka.com.ua/samsung_ue43ku6000uxua/p9886307/\r\n\r\n', 0, 0, 1),
(11, 'Samsung UE22H5600AKXUA', 6, 1834625, 1230, 1, 'Samsung', 'Диагональ экрана: 22"\r\nРазрешение: 1920x1080\r\nДиапазоны цифрового тюнера: DVB-C, DVB-T2\r\n    Smart-платформа: Samsung Smart TV\r\n    Частота развертки панели: 50 Гц\r\n    Частота обновления: 100 Гц (CMR)\r\n    Подробнее: http://rozetka.com.ua/samsung_ue_22h5600/p699334/\r\n\r\n', 0, 0, 1),
(12, 'Samsung UE32J4000AKXUA', 6, 1833624, 1100, 1, 'Samsung', 'Диагональ экрана: 32"\r\nРазрешение: 1366x768\r\nДиапазоны цифрового тюнера: DVB-C, DVB-T2\r\n    Smart-платформа: Нет\r\n    Частота обновления: 100 Гц (CMR)\r\n    Подробнее: http://rozetka.com.ua/samsung_ue32j4000/p4909414/\r\n\r\n', 0, 0, 1),
(13, 'Sony KDL40RD453', 6, 1837126, 784, 1, 'Sony', 'Диагональ экрана: 40"\r\nРазрешение: 1920x1080\r\nДиапазоны цифрового тюнера: DVB-C, DVB-T2, DVB-T\r\n    Smart-платформа: Нет\r\n    Частота обновления: 200 Гц (MotionFlow)\r\n    Подробнее: http://rozetka.com.ua/sony_kdl40rd453br/p9252786/\r\n\r\n', 0, 0, 1),
(26, 'MSI GT73VR-7RF Titan Pro 4K (GT73VR7RF-644UA)', 1, 1839926, 2000, 1, 'MSI', 'Экран 17.3" IPS (3840x2160) UHD 4K, матовый / Intel Core i7-7820HK (2.9 - 3.9 ГГц) / RAM 32 ГБ / HDD 1 ТБ + 2 x SSD 256 ГБ / nVidia GeForce GTX 1080, 8 ГБ / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / Windows 10 / 4.14 кг / черный', 1, 1, 1),
(27, 'MSI GT72VR-7RE Dominator Pro Dragon (GT72VR7RE-631UA)', 1, 1839903, 1550, 1, 'MSI', 'Экран 17.3" (1920x1080) Full HD, матовый / Intel Core i7-7700HQ (2.8 - 3.8 ГГц) / RAM 32 ГБ / HDD 1 ТБ + SSD 256 ГБ / nVidia GeForce GTX 1070, 8 ГБ / DVD Super Multi / LAN / Wi-Fi / Bluetooth / веб-камера / Windows 10 / 3.78 кг / черный', 1, 1, 1),
(28, 'Dell Inspiron 5758 (I57H345DIL-5SL) Silver', 1, 1839723, 520, 1, 'Dell', 'Экран 17.3" (1600x900) HD+, глянцевый / Intel Core i3-5005U (2.0 ГГц) / RAM 4 ГБ / HDD 500 ГБ / Intel HD Graphics 5500 / DVD+/-RW / Wi-Fi / Bluetooth / веб-камера / Linux / 2.83 кг / серебристый', 0, 1, 1),
(29, 'Dell Inspiron 7567 (I75F7810NDL-6B) Black', 1, 1839726, 1230, 1, 'Dell', 'Экран 15.6" (1920x1080) Full HD, матовый / Intel Core i7-7700HQ (2.8 - 3.8 ГГц) / RAM 8 ГБ / SSHD 1 ТБ + 8 ГБ / nVidia GeForce GTX 1050 Ti, 4 ГБ / Без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / Ubuntu Linux / 2.62 кг / черный', 1, 0, 1),
(30, 'Lenovo IdeaPad 310-15IAP (80TT004XRA) Silver', 1, 1839714, 950, 1, 'Lenovo', 'Экран 15.6" (1920x1080) Full HD, глянцевый / Intel Pentium N4200 (1.1 - 2.5 ГГц) / RAM 4 ГБ / SSD 256 ГБ / Intel HD Graphics 505 / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / DOS / 2.2 кг / серебристый', 0, 0, 1),
(31, 'Asus Vivobook X556UQ (X556UQ-DM990D) Dark Blue', 1, 1839704, 1150, 1, 'Asus', 'Экран 15.6" (1920x1080) Full HD, матовый / Intel Core i7-7500U (2.7 - 3.5 ГГц) / RAM 16 ГБ / HDD 1 ТБ / nVidia GeForce 940MX, 2 ГБ / DVD SuperMulti / LAN / Wi-Fi / Bluetooth / веб-камера / DOS / 2.3 кг / темно-синий', 1, 0, 1),
(32, 'Asus Zenbook UX306UA (UX306UA-FB111T) Gray', 1, 1839705, 1150, 1, 'Asus', 'Экран 13.3" IPS (3200x1800) QHD+, матовый / Intel Core i5-6200U (2.3 - 2.8 ГГц) / RAM 8 ГБ / SSD 256 ГБ / Intel HD Graphics 520 / без ОД / Wi-Fi / Bluetooth / веб-камера / Windows 10 / 1.3 кг / серый / сумка', 1, 0, 1),
(33, 'Asus X540SA (X540SA-XX404D) Chocolate Black', 1, 1839706, 450, 1, 'Asus', 'Экран 15.6" (1366x768) WXGA HD, глянцевый / Intel Pentium N3710 (1.6 - 2.6 ГГц) / RAM 4 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / DOS / 1.9 кг / темно-коричневый', 1, 0, 1),
(34, 'Ноутбук Asus X200MA (X200MA-KX315D)', 1, 1839707, 395, 1, 'Asus', 'Экран 11.6" (1366x768) HD LED, глянцевый / Intel Pentium N3530 (2.16 - 2.58 ГГц) / RAM 4 ГБ / HDD 750 ГБ / Intel HD Graphics / без ОД / Bluetooth 4.0 / Wi-Fi / LAN / веб-камера / без ОС / 1.24 кг / синий', 0, 0, 1),
(35, 'Ноутбук HP Stream 11-d050nr', 1, 2343847, 305, 0, 'Hewlett Packard', 'Экран 11.6” (1366x768) HD LED, матовый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / eMMC 32 ГБ / Intel HD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / Windows 8.1 + MS Office 365 / 1.28 кг / синий', 1, 1, 1),
(36, 'Ноутбук Asus X200MA White ', 1, 2028027, 270, 1, 'Asus', 'Экран 11.6" (1366x768) HD LED, глянцевый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / Bluetooth 4.0 / Wi-Fi / LAN / веб-камера / без ОС / 1.24 кг / белый', 0, 1, 1),
(37, 'Ноутбук Acer Aspire E3-112-C65X', 1, 2019487, 325, 1, 'Acer', 'Экран 11.6\'\' (1366x768) HD LED, матовый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / Linpus / 1.29 кг / серебристый', 0, 1, 1),
(38, 'Ноутбук Acer TravelMate TMB115', 1, 1953212, 275, 1, 'Acer', 'Экран 11.6\'\' (1366x768) HD LED, матовый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / LAN / Wi-Fi / Bluetooth 4.0 / веб-камера / Linpus / 1.32 кг / черный', 0, 0, 1),
(39, 'Ноутбук Lenovo Flex 10', 1, 1602042, 370, 0, 'Lenovo', 'Экран 10.1" (1366x768) HD LED, сенсорный, глянцевый / Intel Celeron N2830 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / Windows 8.1 / 1.2 кг / черный', 0, 0, 1),
(40, 'Ноутбук Asus X751MA', 1, 2028367, 430, 1, 'Asus', 'Экран 17.3" (1600х900) HD+ LED, глянцевый / Intel Pentium N3540 (2.16 - 2.66 ГГц) / RAM 4 ГБ / HDD 1 ТБ / Intel HD Graphics / DVD Super Multi / LAN / Wi-Fi / Bluetooth 4.0 / веб-камера / DOS / 2.6 кг / белый', 0, 1, 1),
(41, 'Samsung Galaxy Tab S 10.5 16GB', 2, 1129365, 780, 1, 'Samsung', 'Samsung Galaxy Tab S создан для того, чтобы сделать вашу жизнь лучше. Наслаждайтесь своим контентом с покрытием 94% цветов Adobe RGB и 100000:1 уровнем контрастности, который обеспечивается sAmoled экраном с функцией оптимизации под отображаемое изображение и окружение. Яркий 10.5” экран в ультратонком корпусе весом 467 г порадует вас высоким уровнем портативности. Работа станет проще вместе с Hancom Office и удаленным доступом к вашему ПК. E-Meeting и WebEx – отличные помощники для проведения встреч, когда вы находитесь вне офиса. Надежно храните ваши данные благодаря сканеру отпечатка пальцев.', 1, 1, 1),
(42, 'Samsung Galaxy Tab S 8.4 16GB', 2, 1128670, 640, 1, 'Samsung', 'Экран 8.4" Super AMOLED (2560x1600) емкостный Multi-Touch / Samsung Exynos 5420 (1.9 ГГц + 1.3 ГГц) / RAM 3 ГБ / 16 ГБ встроенной памяти + поддержка карт памяти microSD / Bluetooth 4.0 / Wi-Fi 802.11 a/b/g/n/ac / основная камера 8 Мп, фронтальная 2.1 Мп / GPS / ГЛОНАСС / Android 4.4.2 (KitKat) / 294 г / белый', 0, 0, 1),
(43, 'Gazer Tegra Note 7', 2, 683364, 210, 1, 'Gazer', 'Экран 7" IPS (1280x800) емкостный Multi-Touch / NVIDIA Tegra 4 (1.8 ГГц) / RAM 1 ГБ / 16 ГБ встроенной памяти + поддержка карт памяти microSD / Wi-Fi / Bluetooth 4.0 / основная камера 5 Мп, фронтальная - 0.3 Мп / GPS / ГЛОНАСС / Android 4.4.2 (KitKat) / вес 320 г', 0, 0, 1),
(44, 'Lenovo Yoga Book YB1-X91L 3G+LTE Windows (ZA160021UA)', 2, 683369, 455, 1, 'Lenovo', 'Экран 10.1" IPS (1920x1200) емкостный, MultiTouch / Intel Atom x5-Z8550 (1.44 - 2.4 ГГц) / RAM 4 ГБ / 64 ГБ встроенной памяти + microSD / 3G / LTE / Wi-Fi / Bluetooth 4.0 / основная камера 8.0 Мп + фронтальная 2 Мп / GPS / Windows 10 Pro / 690 г', 0, 1, 1),
(45, 'Lenovo 10 TB-X103F Black (ZA1U0008UA)', 2, 683370, 326, 1, 'Lenovo', 'Экран 10.1" IPS (1280x800) MultiTouch / Qualcomm Snapdragon 210 (1.3 ГГц) / RAM 1 ГБ / 16 ГБ встроенной памяти + microSD / Wi-Fi b/g/n / Bluetooth 4.0 / основная камера 5 Мп + фронтальная - 2 Мп / GPS / Android 6.0 (Marshmallow) / 570 г / черный', 1, 0, 1),
(46, 'Apple iPad A1822 Wi-Fi 32GB Space Gray (MP2F2RK/A)', 2, 683378, 600, 1, 'Apple', 'Экран 9.7" IPS (2048x1536) емкостный MultiTouch / Apple A9 / RAM 2 ГБ / 32 ГБ встроенной памяти / Wi-Fi / Bluetooth 4.2 / основная камера 8 Мп, фронтальная - 1.2 Мп / iOS 10 / 469 г / серый космос', 1, 0, 1),
(47, 'Xiaomi MiPad 2 16GB Silver', 2, 682614, 600, 1, 'Xiaomi', '7.9", 2 ГБ, Wi-Fi, Bluetooth, Android 5.1, Intel Atom x5-Z8500 (1.44 - 2.24 ГГц)', 1, 0, 1),
(48, 'Prestigio Multipad Visconte V (PMP1012TE3GRD)', 2, 6833216, 480, 1, 'Prestigio', 'Экран 10.1" IPS (1280x800) Multi-Touch / Intel Atom Z3735G (1.33 - 1.83 ГГц) / RAM 2 ГБ / 32 ГБ встроенной памяти + microSD / 3G / Wi-Fi / Bluetooth 4.0 / основная камера 2 Мп, фронтальная - 2 Мп / Windows 10 Home / 594 г / черный', 0, 1, 1),
(49, 'Samsung Galaxy Tab S3 9.7" 32GB Silver (SM-T820NZSASEK)', 2, 6833459, 630, 1, 'Samsung', 'Экран 9.7" Super AMOLED (2048x1536) емкостный Multi-Touch / Qualcomm Snapdragon 820 (2.15 ГГц + 1.6 ГГц) / RAM 4 ГБ / 32 ГБ встроенной памяти + поддержка карт памяти microSD / Bluetooth 4.2 / Wi-Fi 802.11 a/b/g/n/ac / основная камера 13 Мп, фронтальная 5 Мп / GPS / ГЛОНАСС / Android 7.0 / 429 г / серебристый', 0, 1, 1),
(50, 'Монитор 23" Dell E2314H Black', 3, 355025, 175, 1, 'Dell', 'С расширением Full HD Вы сможете рассмотреть мельчайшие детали. Dell E2314H предоставит Вам резкое и четкое изображение, с которым любая работа будет в удовольствие. Full HD 1920 x 1080 при 60 Гц разрешение (макс.)', 0, 0, 1),
(51, 'Монитор 21,5" AOC I2269Vw', 3, 3550160, 230, 1, 'AOC', 'Этот Full HD монитор с диагональю 54,6 см (21,5”) — новый эталон качества для дисплеев IPS-матрицей. Он отличается стильным дизайном и оснащен интерфейсами D-Sub и DVI-D. Среди преимуществ IPS-матриц: яркие цвета, а также стабильность цветопередачи в широком диапазоне углов обзора. До недавнего времени дисплеи на основе таких панелей, в основном, использовали профессионалы и компьютерные энтузиасты, однако недорогой монитор i2269Vw доказывает, что теперь данная технология и высокие стандарты качества изображения становятся общедоступными. Модель имеет высокую максимальную яркость, достигающую 250 кд/м2, уровень контрастности 1000:1 (динамическая контрастность: 50 000 000:1) и время отклика 6 мс.', 0, 0, 1),
(52, 'Монитор 23.8" LG 24MP58VQ-P', 3, 3550160, 230, 1, 'LG', 'Тип матрицы: IPS\r\n    Интерфейсы: DVI, HDMI, VGA\r\n    Время реакции матрицы: 5 мс (GtG)\r\n    Яркость дисплея: 250 кд/м²\r\n    Контрастность дисплея: 1000:1\r\n\r\n', 0, 0, 1),
(53, 'Монитор 24" ViewSonic XG2401', 3, 3550132, 430, 1, 'ViewSonic', 'Тип матрицы: TN\r\nИнтерфейсы: USB, DisplayPort, 2 х HDMI\r\nВремя реакции матрицы: 1 мс\r\nЯркость дисплея: 350 кд/м ²\r\nКонтрастность дисплея: 1000:1 / 120 000 000:1', 0, 0, 1),
(60, 'Компьютер Everest Game ', 4, 1563832, 1320, 1, 'Everest', 'Everest Game 9085 — это компьютеры премимум класса, собранные на базе эксклюзивных компонентов, тщательно подобранных и протестированных лучшими специалистами нашей компании. Это топовый сегмент систем, который отвечает наилучшим характеристикам показателей качества и производительности.', 0, 0, 1),
(61, 'ARTLINE Gaming X65 v01 (X65v01)', 4, 1563693, 1500, 1, 'ARTLINE', 'AMD FX-6300 (3.5 ГГц) / RAM 8 ГБ / HDD 1 TБ / nVidia GeForce GTX 750 Ti, 2 ГБ / DVD±RW / LAN / без ОС', 0, 0, 1),
(62, 'ARTLINE Business B23 v05 (B23v05)', 4, 1563965, 1330, 1, 'ARTLINE', 'Intel Celeron G1840 (2.8 ГГц) / RAM 4 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / LAN / без ОС', 0, 0, 1),
(63, 'Asus G20CB-UA004T (90PD01K1-M08090)', 4, 1564378, 1670, 1, 'Asus', 'Intel Core i7-6700 (3.4 - 4.0 ГГц) / RAM 32 ГБ / SSD 256 ГБ + HDD 3 ТБ / nVidia GeForce GTX 1080, 8 ГБ / DVD Super Multi / LAN / Windows 10', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_comment` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `products` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_order`
--

INSERT INTO `product_order` (`id`, `user_name`, `user_phone`, `user_comment`, `user_id`, `date`, `products`, `status`) VALUES
(1, 'Виктор', '89035997361', 'первый заказ', 4, '2015-05-14 09:54:45', '{"1":1,"2":1,"3":2}', 3),
(2, 'Сергей', '89183213213', 'первый заказ', 3, '2015-05-18 15:34:42', '{"44":3,"43":3}', 2),
(3, 'Владимир', '89121231231', 'первый заказ', 5, '2016-10-25 12:21:46', '{"40":2,"41":1,"42":3,"53":3,"27":1,"60":4,"26":2,"10":3,"62":11,"63":4,"1":1,"52":2,"48":1,"49":1}', 4),
(4, 'Владимир', '89121231231', 'второй заказ', 5, '2017-06-27 04:51:43', '{"45":1,"30":1,"49":1,"51":1,"27":1,"62":1}', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Александр', 'alex@yandex.ru', '111111', 'user'),
(2, 'Виктор', 'victor@gmail.com', '222222', 'admin'),
(3, 'Сергей', 'serg@gmail.com', '333333', 'user'),
(4, 'Константин', 'kostya@mail.ru', '123456789', 'user'),
(5, 'Владимир', 'vladimir@yandex.ru', '987654321', 'admin'),
(6, 'Василий', 'vasya@google.com', '123456789', 'user'),
(7, 'Анастасия', 'anastasiya@gmail.com', '123456789', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT для таблицы `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
