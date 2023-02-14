-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 14 2023 г., 08:52
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hotelbooking`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CountryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`CityID`, `Name`, `CountryID`) VALUES
(1, 'Madrid', 1),
(2, 'Tallinn', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phone` int(11) DEFAULT NULL,
  `CountryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`ClientID`, `Username`, `Password`, `Email`, `FirstName`, `LastName`, `Phone`, `CountryID`) VALUES
(1, 'mtalhead', 'j996FGQb7H', 'mtalhead24@gmail.com', 'Daniel', 'Monjane', 59822861, 1),
(2, 'cooldzjuba', '287UZxL4s4', 'dzjuben@gmail.com', 'Maksim', 'Dzjubenko', 53622718, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `CommentID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `Comment` varchar(255) NOT NULL,
  `Rating` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`CommentID`, `ClientID`, `Comment`, `Rating`) VALUES
(1, 1, 'Axel Hotel Madrid is a stylish and modern hotel located in the heart of Madrid. The hotel\'s decor is contemporary and sleek, with comfortable rooms and a welcoming atmosphere. The staff at Axel Hotel Madrid are friendly and attentive, and they work hard t', '5.0'),
(2, 2, 'Modern, good interior, cosy, nice atmosphere and good location', '4.0');

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `CountryID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`CountryID`, `Name`) VALUES
(1, 'Spain'),
(2, 'Estonia');

-- --------------------------------------------------------

--
-- Структура таблицы `hotel`
--

CREATE TABLE `hotel` (
  `HotelID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CityID` int(11) NOT NULL,
  `Stars` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hotel`
--

INSERT INTO `hotel` (`HotelID`, `Name`, `Address`, `Description`, `CityID`, `Stars`) VALUES
(2, 'Axel Hotel Madrid', 'Atocha, 49', 'Set in Madrid city center, Axel Hotel Madrid - Adults Only offers accommodations only 15 minutes’ walk away from Chueca, known by its LGBT atmosphere and welcoming entertainment offer, the hotel is hetero-friendly too.\r\n\r\nEvery stylish room at this hotel ', 1, 4),
(3, 'Bob W Ambassador', '9 Gonsiori', 'You\\\'re eligible for a Genius discount at Bob W Ambassador! To save at this property, all you have to do is sign in.\\n\\nFeaturing a fitness center and free WiFi, Bob W Ambassador is located in the center of Tallinn, close to Kalarand, Estonian National Op', 2, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `hotelcomment`
--

CREATE TABLE `hotelcomment` (
  `ID` int(11) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hotelcomment`
--

INSERT INTO `hotelcomment` (`ID`, `HotelID`, `CommentID`) VALUES
(1, 2, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `hotelroom`
--

CREATE TABLE `hotelroom` (
  `ID` int(11) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hotelroom`
--

INSERT INTO `hotelroom` (`ID`, `HotelID`, `RoomID`) VALUES
(1, 2, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `reservation`
--

CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `Price` double NOT NULL,
  `PurchaseDate` datetime NOT NULL,
  `CheckInDate` datetime NOT NULL,
  `CheckOutDate` datetime NOT NULL,
  `Amount` int(11) DEFAULT 1,
  `ClientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `reservation`
--

INSERT INTO `reservation` (`ReservationID`, `Price`, `PurchaseDate`, `CheckInDate`, `CheckOutDate`, `Amount`, `ClientID`) VALUES
(1, 864, '2023-02-14 09:41:52', '2023-02-15 09:41:52', '2023-02-18 09:41:52', 2, 1),
(2, 75, '2023-02-14 09:51:38', '2023-02-17 09:51:38', '2023-02-18 09:51:38', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `RoomID` int(11) NOT NULL,
  `Number` int(11) NOT NULL,
  `Sleeps` int(11) NOT NULL,
  `Price` double NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Status` enum('OCUPPIED','NOT OCUPPIED') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`RoomID`, `Number`, `Sleeps`, `Price`, `Type`, `Status`) VALUES
(1, 1, 2, 129, 'Standard', 'NOT OCUPPIED'),
(2, 2, 2, 159, 'Standard', 'NOT OCUPPIED'),
(3, 727, 6, 75, 'luxury', 'NOT OCUPPIED');

-- --------------------------------------------------------

--
-- Структура таблицы `roomreservation`
--

CREATE TABLE `roomreservation` (
  `ID` int(11) NOT NULL,
  `ReservationID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `roomreservation`
--

INSERT INTO `roomreservation` (`ID`, `ReservationID`, `RoomID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`),
  ADD KEY `FK_CityCountry` (`CountryID`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `FK_ClientCountry` (`CountryID`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `FK_ClientComment` (`ClientID`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CountryID`);

--
-- Индексы таблицы `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`HotelID`),
  ADD KEY `FK_HotelCity` (`CityID`);

--
-- Индексы таблицы `hotelcomment`
--
ALTER TABLE `hotelcomment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_HotelComment` (`HotelID`),
  ADD KEY `FK_CommentHotel` (`CommentID`);

--
-- Индексы таблицы `hotelroom`
--
ALTER TABLE `hotelroom`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RoomHotel` (`HotelID`),
  ADD KEY `FK_HotelRoom` (`RoomID`);

--
-- Индексы таблицы `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `FK_ClientReservation` (`ClientID`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomID`);

--
-- Индексы таблицы `roomreservation`
--
ALTER TABLE `roomreservation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ReservationRoom` (`ReservationID`),
  ADD KEY `FK_RoomReservation` (`RoomID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `hotel`
--
ALTER TABLE `hotel`
  MODIFY `HotelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `hotelcomment`
--
ALTER TABLE `hotelcomment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `hotelroom`
--
ALTER TABLE `hotelroom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `roomreservation`
--
ALTER TABLE `roomreservation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_CityCountry` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`);

--
-- Ограничения внешнего ключа таблицы `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_ClientCountry` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`);

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_ClientComment` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`);

--
-- Ограничения внешнего ключа таблицы `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `FK_HotelCity` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Ограничения внешнего ключа таблицы `hotelcomment`
--
ALTER TABLE `hotelcomment`
  ADD CONSTRAINT `FK_CommentHotel` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`CommentID`),
  ADD CONSTRAINT `FK_HotelComment` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- Ограничения внешнего ключа таблицы `hotelroom`
--
ALTER TABLE `hotelroom`
  ADD CONSTRAINT `FK_HotelRoom` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`),
  ADD CONSTRAINT `FK_RoomHotel` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- Ограничения внешнего ключа таблицы `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_ClientReservation` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`);

--
-- Ограничения внешнего ключа таблицы `roomreservation`
--
ALTER TABLE `roomreservation`
  ADD CONSTRAINT `FK_ReservationRoom` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`),
  ADD CONSTRAINT `FK_RoomReservation` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
