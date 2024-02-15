-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Фев 15 2024 г., 17:48
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_haziahmetov8010_vibori`
--

-- --------------------------------------------------------

--
-- Структура таблицы `results_on_regions`
--

CREATE TABLE `results_on_regions` (
  `id_region` int NOT NULL,
  `id_number_station` int NOT NULL,
  `number_station` int NOT NULL,
  `number_of_voters` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `results_on_regions`
--

INSERT INTO `results_on_regions` (`id_region`, `id_number_station`, `number_station`, `number_of_voters`) VALUES
(5, 1, 456, 5434),
(9, 2, 456, 576),
(8, 3, 532, 7542),
(10, 4, 543, 2464),
(11, 5, 2354, 2454);

-- --------------------------------------------------------

--
-- Структура таблицы `results_on_station`
--

CREATE TABLE `results_on_station` (
  `id_station` int DEFAULT NULL,
  `id_candidats` int NOT NULL,
  `number_of_voters` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `results_on_station`
--

INSERT INTO `results_on_station` (`id_station`, `id_candidats`, `number_of_voters`) VALUES
(1, 1, 5434),
(2, 2, 5434),
(3, 3, 28765),
(4, 4, 5434),
(5, 5, 7542);

-- --------------------------------------------------------

--
-- Структура таблицы `vibory`
--

CREATE TABLE `vibory` (
  `id_region` int NOT NULL,
  `region` varchar(255) NOT NULL,
  `ipolling_station` int NOT NULL,
  `id_candidate` int NOT NULL,
  `candidate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `results_vote_on_the_stage` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `vibory`
--

INSERT INTO `vibory` (`id_region`, `region`, `ipolling_station`, `id_candidate`, `candidate`, `results_vote_on_the_stage`) VALUES
(5, 'татарстан', 456, 1, 'Данила Владимирович Кашин', 667),
(8, 'москва', 858, 2, 'Андрей Андреевич Замай', 2024),
(9, 'санкт-питербург', 245, 3, 'максим максимович шабанов', 2030),
(10, 'хмао', 624, 4, 'Зубенко Михаил Петрович', 6466),
(11, 'омэрика', 666, 5, 'глупый бидон бургер', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `results_on_regions`
--
ALTER TABLE `results_on_regions`
  ADD PRIMARY KEY (`id_number_station`),
  ADD KEY `id_region` (`id_region`);

--
-- Индексы таблицы `results_on_station`
--
ALTER TABLE `results_on_station`
  ADD PRIMARY KEY (`id_candidats`),
  ADD KEY `id_station` (`id_station`);

--
-- Индексы таблицы `vibory`
--
ALTER TABLE `vibory`
  ADD PRIMARY KEY (`id_region`),
  ADD KEY `id_candidate` (`id_candidate`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `results_on_regions`
--
ALTER TABLE `results_on_regions`
  MODIFY `id_number_station` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `vibory`
--
ALTER TABLE `vibory`
  MODIFY `id_region` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `results_on_regions`
--
ALTER TABLE `results_on_regions`
  ADD CONSTRAINT `results_on_regions_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `vibory` (`id_region`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `results_on_station`
--
ALTER TABLE `results_on_station`
  ADD CONSTRAINT `results_on_station_ibfk_1` FOREIGN KEY (`id_station`) REFERENCES `results_on_regions` (`id_number_station`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `vibory`
--
ALTER TABLE `vibory`
  ADD CONSTRAINT `vibory_ibfk_1` FOREIGN KEY (`id_candidate`) REFERENCES `results_on_station` (`id_candidats`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
