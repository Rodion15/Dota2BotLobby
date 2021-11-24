
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Структура таблицы `bot`
--

CREATE TABLE IF NOT EXISTS `bot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_name` text,
  `steam_user` text,
  `steam_pass` text,
  `steam_guard_code` text NOT NULL,
  `two_factor_code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `lobby`
--

CREATE TABLE IF NOT EXISTS `lobby` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text,
  `password` text,
  `settings_id` int(11) DEFAULT NULL,
  `status` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_id` (`settings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `lobby_user`
--

CREATE TABLE IF NOT EXISTS `lobby_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lobby_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lobby_id` (`lobby_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leagueid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `steam-id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lobby`
--
ALTER TABLE `lobby`
  ADD CONSTRAINT `lobby_ibfk_1` FOREIGN KEY (`settings_id`) REFERENCES `settings` (`id`);

--
-- Ограничения внешнего ключа таблицы `lobby_user`
--
ALTER TABLE `lobby_user`
  ADD CONSTRAINT `lobby_user_ibfk_1` FOREIGN KEY (`lobby_id`) REFERENCES `lobby` (`id`),
  ADD CONSTRAINT `lobby_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
