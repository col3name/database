-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 22 2018 г., 15:45
-- Версия сервера: 5.5.48
-- Версия PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `dish`
--

CREATE TABLE IF NOT EXISTS `dish` (
  `id_dish` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_type_dish` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id_product` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `calorific` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id_product`, `name`, `calorific`) VALUES
(1, 'Рис', 132),
(3, 'Морковь', 50);

-- --------------------------------------------------------

--
-- Структура таблицы `product_in_recipe`
--

CREATE TABLE IF NOT EXISTS `product_in_recipe` (
  `id_product_in_recipe` int(11) unsigned NOT NULL,
  `id_recipe` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `recipe`
--

CREATE TABLE IF NOT EXISTS `recipe` (
  `id_recipe` int(11) unsigned NOT NULL,
  `id_dish` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_dish`
--

CREATE TABLE IF NOT EXISTS `type_dish` (
  `id_type_dish` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id_dish`),
  ADD KEY `id_type_dish` (`id_type_dish`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Индексы таблицы `product_in_recipe`
--
ALTER TABLE `product_in_recipe`
  ADD PRIMARY KEY (`id_product_in_recipe`);

--
-- Индексы таблицы `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id_recipe`);

--
-- Индексы таблицы `type_dish`
--
ALTER TABLE `type_dish`
  ADD PRIMARY KEY (`id_type_dish`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dish`
--
ALTER TABLE `dish`
  MODIFY `id_dish` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `product_in_recipe`
--
ALTER TABLE `product_in_recipe`
  MODIFY `id_product_in_recipe` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id_recipe` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `type_dish`
--
ALTER TABLE `type_dish`
  MODIFY `id_type_dish` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_5` FOREIGN KEY (`id_type_dish`) REFERENCES `type_dish` (`id_type_dish`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
