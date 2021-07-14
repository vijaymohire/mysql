-- phpMyAdmin SQL Dump
-- version 2.11.9.4
-- http://www.phpmyadmin.net
--
-- Host: oniddb
-- Generation Time: Nov 30, 2013 at 04:46 AM
-- Server version: 5.1.63
-- PHP Version: 5.2.6-1+lenny16

--
-- Database: `adatiaa-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
CREATE TABLE IF NOT EXISTS `amenities` (
  `amenities_id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(100) NOT NULL,
  `des` text NOT NULL,
  `amenityname` varchar(70) NOT NULL,
  PRIMARY KEY (`amenities_id`)
) TYPE=InnoDB  AUTO_INCREMENT=15 ;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`amenities_id`, `pic`, `des`, `amenityname`) VALUES
(1, 'amenities/IconAC.jpg', 'Every room in the Tamera Plaza Inn has Air Conditioning. Each room has an easy-to-use remote control to set your comfort level without having to leave the bed.', 'Air Condition'),
(2, 'amenities/IconBkfst.jpg', 'Upon your arrival, you will recieve a complimentary "Welcome Drink" for your travel here. Also, there is Free Breakfast for all accomodations.', 'Breakfast'),
(3, 'amenities/IconCocktail.jpg', 'Located in the lobby, we offer a full-service Bar & Coffee Shop with a variety of beverages. ', 'Cocktail'),
(4, 'amenities/IconFunction.jpg', 'Located on the 4th floor, we hold many activities for all occasions here in the Function Room. One can reserve this room for conferences, parties, and more.', 'Function hall'),
(5, 'amenities/IconGen.jpg', 'We have generators on standby 24 hours a day, 7 days a week in an event of a "Brown Out", providing uninterrupted electricity service to the building.', 'Generator'),
(6, 'amenities/IconLaundry.jpg', 'Whether on business or pleasure, we provide laundry and pressing service here. We deliver your clothes to your room, or in person to accomodate your schedule.', 'Laundry'),
(7, 'amenities/IconLongDist.jpg', 'Need to call home or send documents? We provide Fax services and phones equipped for Long Distance calls to home, the office, or anywhere in between.', 'Long distance calls'),
(8, 'amenities/restaurantLG.jpg', 'Not only a great place to eat, but has great street-side view of Bacolod City. Try the famous "Tamera Chicken", great for the whole family!', 'Restaurant'),
(9, 'amenities/IconShower.jpg', 'Every room is individualy equipped with personal water heaters in the showers. Fully adjustable, you''ll always have a comfortable shower without burning or freezing yourself.', 'Shower'),
(10, 'amenities/IconTaxi.jpg', 'Have a meeting to go to or just want to go out? You can schedule trips anywhere around Bacolod City by utilizing our transportation service offered here.', 'On call Taxi'),
(11, 'amenities/IconTV.jpg', 'No room would be complete without complimentary Cable TV and telephone service in every room. Channels may vary.', 'Television'),
(12, 'amenities/SmIconWiFi.png', 'All area of Tamera Plaza Inn is wifi ready', 'Wi Fi '),
(13, '', '', 'Free city ride'),
(14, '', '', 'Free brunch');

-- --------------------------------------------------------

--
-- Table structure for table `amenities_has_room`
--

DROP TABLE IF EXISTS `amenities_has_room`;
CREATE TABLE IF NOT EXISTS `amenities_has_room` (
  `amenities_amenities_id` int(11) NOT NULL,
  `room_room_id` int(11) NOT NULL,
  PRIMARY KEY (`amenities_amenities_id`,`room_room_id`),
  KEY `fk_amenities_has_room_room1_idx` (`room_room_id`),
  KEY `fk_amenities_has_room_amenities1_idx` (`amenities_amenities_id`)
) TYPE=InnoDB;

--
-- Dumping data for table `amenities_has_room`
--

INSERT INTO `amenities_has_room` (`amenities_amenities_id`, `room_room_id`) VALUES
(1, 8),
(2, 8),
(3, 8),
(11, 8),
(12, 8),
(1, 9),
(2, 9),
(3, 9),
(12, 9),
(1, 10),
(2, 10),
(3, 10),
(8, 10),
(9, 10),
(11, 10),
(12, 10),
(14, 10),
(1, 11),
(2, 11),
(3, 11),
(5, 11),
(7, 11),
(8, 11),
(9, 11),
(11, 11),
(12, 11),
(13, 11),
(14, 11);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `reservation_reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_reservation1_idx` (`reservation_reservation_id`)
) TYPE=InnoDB  AUTO_INCREMENT=3 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `name`, `email`, `content`, `reservation_reservation_id`) VALUES
(1, 'arif', 'teachasda@gmail.com', 'Your booking is confirmed, Enjoy your holidays', 1),
(2, '', 'teachasda@gmail.com', 'No Lions and tigers please', 15);

-- --------------------------------------------------------

--
-- Table structure for table `payment_notification`
--

DROP TABLE IF EXISTS `payment_notification`;
CREATE TABLE IF NOT EXISTS `payment_notification` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `item_number` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `amount` decimal(65,2) NOT NULL,
  `currency` varchar(20) NOT NULL,
  `txn_id` varchar(30) NOT NULL,
  `payer_email` varchar(100) NOT NULL,
  PRIMARY KEY (`pay_id`)
) TYPE=InnoDB  AUTO_INCREMENT=3 ;

--
-- Dumping data for table `payment_notification`
--

INSERT INTO `payment_notification` (`pay_id`, `item_name`, `item_number`, `status`, `amount`, `currency`, `txn_id`, `payer_email`) VALUES
(1, 'Superior', 'hssa40d5', 'CompletedOut', 3000.00, '$', '14G24020NN154222R', 'teachasda@gmail.com'),
(2, 'Standard Double', 'p2mzycvy', 'Completed', 33.00, '$', '66J76616N2842804Y', 'teachasda@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip` int(11) NOT NULL,
  `province` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `arrival` varchar(30) NOT NULL,
  `departure` varchar(30) NOT NULL,
  `adults` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  `no_room` int(11) NOT NULL,
  `payable` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `confirmation` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `pay_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `user_id_fk` (`user_id`),
  KEY `room_id_fk` (`room_id`),
  KEY `pay_id_fk` (`pay_id`)
) TYPE=InnoDB  AUTO_INCREMENT=16 ;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `firstname`, `lastname`, `city`, `zip`, `province`, `country`, `email`, `contact`, `username`, `password`, `arrival`, `departure`, `adults`, `child`, `result`, `no_room`, `payable`, `status`, `confirmation`, `user_id`, `room_id`, `pay_id`) VALUES
(1, 'arif', 'adatia', 'Toronto', 12345, 'ON', 'CA', 'teachasda@gmail.com', 416278, 'arif', 'password', '01/01/2014', '02/01/2014', 1, 0, 2, 1, 1000, '', 'hssa40d5', 1, 8, 1),
(2, '', '', '', 0, '', '', 'aadatia@connect.carleton.ca', 0, '', '123456', '3/01/2014', '5/1/2014', 1, 0, 2, 0, 1, '', 'avtxyjw8', 1, 9, 2),
(3, 'mec', 'ol', 'bac', 6110, 'tang', 'phil', 'adatiaa@onid.orst.edu ', 21474, '', '12345', '01/02/2014', '02/01/2014', 1, 0, 6, 1, 9000, '', 'b0hz8hy6', 1, 8, 2),
(4, 'a', 'a', 'a', 1, 'a', 'a', 'teachasda@gmail.com', 1, '', 'A', '3/01/2014', '04/01/2014', 1, 0, -1, 6, -1500, '', 'jeggntns', 1, 9, 2),
(6, 'Arif1', 'Adatia', 'London', 123, '122, Hi St', 'UK', 'adatiaa@onid.orst.edu', 1234, '', 'password', '24/11/2013', '26/11/2013', 1, 0, 2, 1, 950, '', 'yypj7snx', 1, 8, 1),
(7, '', '', '', 0, '', '', '', 0, '', '', '24/11/2013', '26/11/2013', 1, 0, 2, 1, 1100, '', 'b4ehqnzg', 1, 8, 1),
(8, 'arif', 'adatia', 'Toronto', 12345, 'ON', 'CA', 'teachasda@gmail.com', 416278, '', 'password', '26/11/2013', '27/11/2013', 1, 0, 1, 1, 1100, '', '084riq4n', 1, 8, 1),
(9, 'arif', 'adatia', 'Toronto', 12345, 'ON', 'CA', 'teachasda@gmail.com', 416278, '', 'password', '26/11/2013', '27/11/2013', 1, 0, 1, 1, 1100, '', 'day3ojv3', 1, 8, 1),
(10, 'Vijay1', 'Mohire1', 'Delhi', 12345, '122, reclaim st', 'IN', 'vijaymohire@gmail.com', 1234, '', 'password', '26/11/2013', '27/11/2013', 1, 0, 1, 1, 950, '', 'pow02xz8', 1, 8, 1),
(11, 'Arif 2', 'Adatia 2', 'NY', 1234, '123, Hi st, Hounslow', 'USA', 'adatiaa@onid.orst.edu', 1234, '', 'password', '26/11/2013', '27/11/2013', 1, 0, 1, 1, 950, '', '6vjj83g3', 1, 8, 1),
(13, 'Arif 4', 'Adatia4', 'TO', 1234, 'No 4, ', 'CA', 'teachasda@gmail.com', 12345, '', 'password', '28/11/2013', '29/11/2013', 1, 0, 1, 1, 950, '', 'n5whtwj7', 1, 8, 1),
(15, 'Zebra1', 'Animal1', 'Zoo1', 1234, 'Zoo1', 'IN', 'teachasda@gmail.com', 2345, '', 'zebra', '30/11/2013', '03/12/2013', 1, 0, 4, 1, 950, '', 'wtfi30p2', 1, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `rate` int(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `image` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `max_adult` int(11) NOT NULL,
  `max_child` int(11) NOT NULL,
  `amenities_amenities_id` int(11) NOT NULL,
  PRIMARY KEY (`room_id`,`amenities_amenities_id`),
  KEY `fk_room_amenities1_idx` (`amenities_amenities_id`)
) TYPE=InnoDB  AUTO_INCREMENT=11 ;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `type`, `rate`, `description`, `image`, `qty`, `max_adult`, `max_child`, `amenities_amenities_id`) VALUES
(8, 'Standard Single', 950, 'Fully air conditioned', 'photos/Single.jpg', 3, 1, 1, 1),
(9, 'Standard Double', 1100, 'Fully air conditioned', 'photos/images.jpg', 3, 1, 1, 2),
(10, 'Deluxe', 1500, 'Double king sized bed with hot and cold shower', 'photos/Deluxe.jpg', 4, 2, 2, 1),
(11, 'Superior', 2000, 'Three king sized bed,with air conditioned', 'photos/superior.jpg', 6, 3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roominventory`
--

DROP TABLE IF EXISTS `roominventory`;
CREATE TABLE IF NOT EXISTS `roominventory` (
  `roominventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `arrival` varchar(30) NOT NULL,
  `departure` varchar(30) NOT NULL,
  `qty_reserve` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `confirmation` varchar(10) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`roominventory_id`),
  KEY `fk_roominventory` (`room_id`)
) TYPE=InnoDB  AUTO_INCREMENT=13 ;

--
-- Dumping data for table `roominventory`
--

INSERT INTO `roominventory` (`roominventory_id`, `arrival`, `departure`, `qty_reserve`, `room_id`, `confirmation`, `status`) VALUES
(1, '01/01/2014', '02/01/2014', 1, 8, 'hssa40d5', 'out'),
(2, '3/01/2014', '5/01/2014', 1, 9, 'avtxyjw8', 'Active'),
(4, '24/11/2013', '26/11/2013', 1, 9, 'b4ehqnzg', 'Active'),
(5, '24/11/2013', '25/11/2013', 0, 8, 'swpiwrmn', ''),
(6, '26/11/2013', '27/11/2013', 1, 9, '084riq4n', 'Active'),
(7, '26/11/2013', '27/11/2013', 1, 9, 'day3ojv3', 'Active'),
(9, '26/11/2013', '27/11/2013', 0, 8, 'pow02xz8', ''),
(10, '28/11/2013', '29/11/2013', 1, 8, 'n5whtwj7', ''),
(11, '30/11/2013', '02/12/2013', 1, 8, '7i40voda', ''),
(12, '30/11/2013', '03/12/2013', 1, 8, 'wtfi30p2', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(45) DEFAULT NULL,
  `user_lastname` varchar(45) DEFAULT NULL,
  `loginemail` varchar(50) DEFAULT NULL,
  `loginpassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) TYPE=InnoDB  AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_firstname`, `user_lastname`, `loginemail`, `loginpassword`) VALUES
(1, 'arif', 'adatia', 'teachasda@gmail.com', 'password'),
(2, 'Arif1', 'Adatia', 'adatiaa@onid.orst.ed', 'password'),
(3, 'Vijay', 'Mohire', 'vijaymohire@gmail.co', 'password'),
(4, 'Arif 2', 'Adatia 2', 'adatiaa@onid.orst.edu', 'password'),
(6, 'Cat', 'Animal', 'teachasda@gmail.com', 'cat'),
(7, 'Zebra', 'Animal', 'teachasda@gmail.com', 'zebra');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amenities_has_room`
--
ALTER TABLE `amenities_has_room`
  ADD CONSTRAINT `fk_amenities_has_room_amenities1` FOREIGN KEY (`amenities_amenities_id`) REFERENCES `amenities` (`amenities_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_amenities_has_room_room1` FOREIGN KEY (`room_room_id`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_reservation1` FOREIGN KEY (`reservation_reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_id_fk` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pay_id_fk` FOREIGN KEY (`pay_id`) REFERENCES `payment_notification` (`pay_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `fk_room_amenities1` FOREIGN KEY (`amenities_amenities_id`) REFERENCES `amenities` (`amenities_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `roominventory`
--
ALTER TABLE `roominventory`
  ADD CONSTRAINT `fk_roominventory` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;
