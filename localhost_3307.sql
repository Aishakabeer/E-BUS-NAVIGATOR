-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Oct 29, 2024 at 08:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-bus navigator`
--
CREATE DATABASE IF NOT EXISTS `e-bus navigator` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `e-bus navigator`;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `BUS_ID` int(11) NOT NULL,
  `LOGIN_ID` bigint(11) DEFAULT NULL,
  `BUS_NAME` varchar(20) DEFAULT NULL,
  `REG_NO` varchar(30) DEFAULT NULL,
  `PH_NO` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`BUS_ID`, `LOGIN_ID`, `BUS_NAME`, `REG_NO`, `PH_NO`) VALUES
(1, 7, 'SANA', 'KL01A007', 90463214),
(2, 6, 'JHONYS', 'KL01M369', 904632146),
(3, 5, 'KOMBAN', 'KL99G336', 124567893),
(4, 10, 'MARIA', 'KL 55 D 5643', 9867894636);

-- --------------------------------------------------------

--
-- Table structure for table `bustime`
--

CREATE TABLE `bustime` (
  `BUSTIME_ID` int(11) NOT NULL,
  `BUS_ID` int(11) DEFAULT NULL,
  `LOGIN_ID` bigint(11) DEFAULT NULL,
  `BUS_NAME` varchar(20) DEFAULT NULL,
  `STOP` varchar(30) DEFAULT NULL,
  `TIME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bustime`
--

INSERT INTO `bustime` (`BUSTIME_ID`, `BUS_ID`, `LOGIN_ID`, `BUS_NAME`, `STOP`, `TIME`) VALUES
(1, 1, 7, 'SANA', 'THRISSUR', '12:00 PM'),
(2, 2, 6, 'JHONYS', 'KUTTIPURAM', '12:30 PM'),
(3, 3, 5, 'KOMBAN', 'EDAPPAL', '12:40 PM');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `DRIVER-ID` int(11) NOT NULL,
  `LOGIN-ID` int(11) DEFAULT NULL,
  `BUS_ID` int(11) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `CONTACT` bigint(20) DEFAULT NULL,
  `BUSNAME` varchar(30) DEFAULT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`DRIVER-ID`, `LOGIN-ID`, `BUS_ID`, `NAME`, `CONTACT`, `BUSNAME`, `ADDRESS`, `EMAIL`) VALUES
(1, 0, NULL, 'shafnaa', 9037559800, 'hamdi', 'white house edappal', 'shaf@gmail.com'),
(2, NULL, 2, 'JHONY', 1234567890, 'JHONYS', '123 Main St', 'jhony@example.com'),
(3, NULL, 3, 'KOMBAN', 9876543210, 'KOMBAN', '456 Second St', 'komban@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ID` int(11) NOT NULL,
  `USER-ID` int(11) DEFAULT NULL,
  `FEEDBACK` varchar(50) DEFAULT NULL,
  `DATE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`ID`, `USER-ID`, `FEEDBACK`, `DATE`) VALUES
(3, 2, 'Very nice service', '2024-10-27'),
(4, 5, 'good', '2024-05-14'),
(5, 21, 'not good', '2024-10-16');

-- --------------------------------------------------------

--
-- Table structure for table `history travel`
--

CREATE TABLE `history travel` (
  `ID` int(11) NOT NULL,
  `FROMS` varchar(30) DEFAULT NULL,
  `TOS` varchar(30) DEFAULT NULL,
  `DATE` varchar(30) DEFAULT NULL,
  `BUS_ID` int(11) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `history travel`
--

INSERT INTO `history travel` (`ID`, `FROMS`, `TOS`, `DATE`, `BUS_ID`, `PHONE_NUMBER`) VALUES
(1, 'KOZHIKODE', 'PALAKKAD', '5/3/21', 1, 2147483647),
(2, 'PERINTHALMANA', 'MALAPPURAM', '6/3/21', 2, 2147483647),
(3, 'MANKADA', 'PERINTHALMANA', '5/4/21', 2, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LOCATION_ID` int(11) NOT NULL,
  `BUS_ID` int(11) DEFAULT NULL,
  `LATITUDE` varchar(30) DEFAULT NULL,
  `LONGITUDE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(30) DEFAULT NULL,
  `TYPE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ID`, `USERNAME`, `PASSWORD`, `TYPE`) VALUES
(2, 'Pavin', '1234', 'admin'),
(3, 'Adhul', '4210', 'admin'),
(4, '7997790430', '0000', 'user'),
(4, 'mukesh', '123456', 'bus'),
(5, 'Bibish', '123456', 'bus'),
(6, '123456789', '0000', 'bus'),
(7, 'vinod', '123456', 'regected'),
(8, 'shaf', '12345@Aa', 'driver'),
(9, 'hamnaa', '12345!Aa', 'user'),
(10, 'Farhan', '123456', 'regected');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `PASS-ID` int(11) NOT NULL,
  `LOGIN-ID` int(11) DEFAULT NULL,
  `FNAME` varchar(30) DEFAULT NULL,
  `LNAME` varchar(30) DEFAULT NULL,
  `GENDER` varchar(30) DEFAULT NULL,
  `PLACE` varchar(30) DEFAULT NULL,
  `POST` varchar(30) DEFAULT NULL,
  `PIN` int(11) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `CONTACT` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`PASS-ID`, `LOGIN-ID`, `FNAME`, `LNAME`, `GENDER`, `PLACE`, `POST`, `PIN`, `EMAIL`, `CONTACT`) VALUES
(1, 123, 'rahul', 'p', 'male', 'plkd', 'plkd', 12364, 'pottan@gmail.com', 100),
(2, 321, 'arun', 'vava', 'male', 'srnr', 'srnr', 7412, '9@gmail.com', 741),
(3, 0, 'hamna', 'hamna', 'female', 'vkd', 'vkd', 679562, 'hamnabasheer07@gmail.com', 9037559822);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `ID` int(11) NOT NULL,
  `FROMS` varchar(30) DEFAULT NULL,
  `TOS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`ID`, `FROMS`, `TOS`) VALUES
(1, 'KOZHIKODE', 'PALAKKAD'),
(2, 'PERINTHALMANA', 'MALAPPURAM'),
(3, 'MANKADA', 'PERINTHALMANA'),
(4, 'MANJERI', 'PERINTHALMANA'),
(5, 'ERANAMKULAM', 'COIMBATHORE');

-- --------------------------------------------------------

--
-- Table structure for table `stop`
--

CREATE TABLE `stop` (
  `STOP_ID` int(11) NOT NULL,
  `ROUTE_ID` int(11) DEFAULT NULL,
  `STOP` varchar(30) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stop`
--

INSERT INTO `stop` (`STOP_ID`, `ROUTE_ID`, `STOP`, `LATITUDE`, `LONGITUDE`) VALUES
(1, 1, 'MALAPPURAM', 11.051, 76.0711),
(3, 2, 'mankada', 345.00948773, 295.32040047),
(4, 3, 'MARANJERY', 234.2004322, 306.3230056),
(5, 4, 'malappuram', 123.55909, 342.5999);

-- --------------------------------------------------------

--
-- Table structure for table `time schedule`
--

CREATE TABLE `time schedule` (
  `TIME_ID` int(11) NOT NULL,
  `BUS_ID` int(11) DEFAULT NULL,
  `STOP_ID` int(11) DEFAULT NULL,
  `TIME` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `time schedule`
--

INSERT INTO `time schedule` (`TIME_ID`, `BUS_ID`, `STOP_ID`, `TIME`) VALUES
(1, 5, 1, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`BUS_ID`),
  ADD UNIQUE KEY `REG_NO` (`REG_NO`);

--
-- Indexes for table `bustime`
--
ALTER TABLE `bustime`
  ADD PRIMARY KEY (`BUSTIME_ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`DRIVER-ID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `history travel`
--
ALTER TABLE `history travel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LOCATION_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`,`USERNAME`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PASS-ID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `stop`
--
ALTER TABLE `stop`
  ADD PRIMARY KEY (`STOP_ID`);

--
-- Indexes for table `time schedule`
--
ALTER TABLE `time schedule`
  ADD PRIMARY KEY (`TIME_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `BUS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bustime`
--
ALTER TABLE `bustime`
  MODIFY `BUSTIME_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `DRIVER-ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `history travel`
--
ALTER TABLE `history travel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `PASS-ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stop`
--
ALTER TABLE `stop`
  MODIFY `STOP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `time schedule`
--
ALTER TABLE `time schedule`
  MODIFY `TIME_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"e-bus navigator\",\"table\":\"time schedule\"},{\"db\":\"e-bus navigator\",\"table\":\"stop\"},{\"db\":\"e-bus navigator\",\"table\":\"route\"},{\"db\":\"e-bus navigator\",\"table\":\"passenger\"},{\"db\":\"e-bus navigator\",\"table\":\"login\"},{\"db\":\"e-bus navigator\",\"table\":\"location\"},{\"db\":\"e-bus navigator\",\"table\":\"feedback\"},{\"db\":\"e-bus navigator\",\"table\":\"bus\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-10-21 18:26:20', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":279}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `supply_chain`
--
CREATE DATABASE IF NOT EXISTS `supply_chain` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `supply_chain`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(50) NOT NULL,
  `area_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `area_name`, `area_code`) VALUES
(1, 'Sarkhej', 'MLPM'),
(2, 'Vastrapur', 'TSR'),
(3, 'Maninagar', 'KTM'),
(4, 'New Ranip', 'ERNKM'),
(5, 'Vejalpur', 'WYND');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(25) NOT NULL,
  `cat_details` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_details`, `status`) VALUES
(1, 'saree', '', 1),
(2, 'kurtha', '', 1),
(3, 'jeans', '', 1),
(4, 'salwar', '', 1),
(5, 'Fabric', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `dist_id` int(11) NOT NULL,
  `dist_name` varchar(25) NOT NULL,
  `dist_email` varchar(50) DEFAULT NULL,
  `dist_phone` varchar(10) NOT NULL,
  `dist_address` varchar(200) DEFAULT NULL,
  `dist_photo` varchar(50) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`dist_id`, `dist_name`, `dist_email`, `dist_phone`, `dist_address`, `dist_photo`, `status`) VALUES
(1, 'Nishant Shah', 'nishant45@gmail.com', '8980769792', 'Alpha Mall, Vastrapur, Ahmedabad', 'avatar.png', 2),
(2, 'Rahul Pandey', 'rahul431@gmail.com', '9099432197', 'Gota, S.G. Highway, Ahmedabad', 'boy.png', 3),
(3, 'Pawan Panchal', 'pawan.rocks@gmail.com', '7878025437', 'Modhera Stadium, Ahmedabad', 'bussiness-man.png', 3),
(4, 'Pushpak Patel', 'pushpak@gmail.com', '9012376544', 'Navrangpura, Ahmedabad', 'gamer.png', 3),
(5, 'Haniket Patel', 'hanipatel@gmail.com', '8980745372', 'CTM, Ahmeda', 'man.png', 3),
(6, 'shajmil vj', 'v.jshejmil@gmail.com', '7464568545', 'vadakkethalkkal house\r\np.o perinjanam,thrissur,kerala,680686', 'man-avatar.png', 3),
(9, 'sandr', 'sandra@gmail.com', '8888888888', 'sandra at house', 'young-man.png', 3),
(10, 'hussain', 'v.jshejmil@gmail.com', '096568545', 'vadakkethalkkal house\r\np.o perinjanam,thrissur,kerala,680686', 'IMG-20190905-WA0005 - Copy (2).jpg', 3),
(11, 'shajmil vj', 'v.jshejmil@gmail.com', '094568545', 'vadakkethalkkal house\r\np.o perinjanam,thrissur,kerala,680686', '', 3),
(12, 'test', 'test@gmail.com', '096456845', 'vadakkethalkkal house\r\np.o perinjanam,thrissur,kerala,680686', 'IMG-20190905-WA0005 - Copy (2).jpg', 1),
(16, 'Mohammad fazil', 'ejmil@gmail.com', '7025495882', 'Pokakkilath house p.o perinjanam west \r\nPin 680686', 'download (9).jpg', 1),
(17, 'AKHILA', 'AKHILA@GMAIL.COM', '9605760015', 'Pokakkilath house p.o perinjanam west \r\nPin 680686', 'logo.png', 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `order_id` int(100) NOT NULL,
  `status` int(10) NOT NULL,
  `dist_id` int(10) DEFAULT NULL,
  `man_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `date`, `order_id`, `status`, `dist_id`, `man_id`) VALUES
(45, '2022-01-31', 42, 1, 6, 11),
(46, '2022-01-31', 44, 1, 5, 2),
(47, '2022-02-23', 50, 1, 6, 28),
(48, '2022-02-23', 45, 1, 6, 11),
(49, '2022-02-26', 47, 1, 9, 11),
(50, '2022-02-26', 46, 1, 6, 11),
(51, '2022-02-26', 52, 1, 1, 11),
(52, '2022-02-24', 54, 1, 6, 11),
(53, '2022-02-26', 55, 1, 12, 31),
(54, '2024-10-27', 53, 1, 16, 11),
(55, '2022-02-26', 51, 1, 4, 11),
(56, '2022-02-26', 56, 1, 9, 31),
(57, '2022-02-26', 58, 1, 17, 31),
(58, '2022-02-26', 59, 1, 17, 31);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `man_id` int(11) NOT NULL,
  `man_name` varchar(25) NOT NULL,
  `man_email` varchar(50) DEFAULT NULL,
  `man_phone` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `man_photo` varchar(200) DEFAULT NULL,
  `qstn` varchar(300) DEFAULT NULL,
  `ans` varchar(150) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`man_id`, `man_name`, `man_email`, `man_phone`, `username`, `password`, `man_photo`, `qstn`, `ans`, `status`) VALUES
(11, 'Suresh Kumar', 'suresh@gmail.com', '9890234511', 'suresh', '3e6a0966890c85a8ca932302ad6a2405', 'boy.png', 'my age', '16', 1),
(38, 'Riya', 'riyakp@gmail.com', '8078544638', 'riyaa', '81dc9bdb52d04dc20036dbd8313ed055', '', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `man_id` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `invoice_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `retailer_id`, `man_id`, `status`, `total_amount`, `invoice_id`) VALUES
(42, '2022-01-31', 1, 11, 1, '2,040.00', 45),
(43, '2022-01-31', 1, 8, 0, '161.00', NULL),
(44, '2022-01-31', 4, 2, 1, '1,575.00', 46),
(45, '2022-02-02', 7, 11, 1, '3,150.15', 48),
(46, '2022-02-02', 7, 11, 1, '1,266.68', 50),
(47, '2022-02-02', 7, 11, 1, '784.00', 49),
(48, '2022-02-03', 11, 8, 0, '4,480.00', NULL),
(49, '2022-02-23', 7, 28, 0, '516.00', NULL),
(50, '2022-02-23', 7, 28, 1, '60.00', 47),
(51, '2022-02-23', 7, 11, 1, '2,400.00', 55),
(52, '2022-02-24', 7, 11, 1, '5,760.00', 51),
(53, '2022-02-24', 7, 11, 1, '3,108.00', 54),
(54, '2022-02-24', 7, 11, 1, '1,680.00', 52),
(55, '2022-02-26', 7, 31, 1, '180.00', 53),
(56, '2022-02-26', 1, 31, 1, '84.00', 56),
(57, '2022-02-26', 1, 27, 0, '4,444,444.00', NULL),
(58, '2022-02-26', 7, 31, 1, '168.00', 57),
(59, '2022-02-26', 7, 31, 2, '48.00', 58),
(60, '2022-02-26', 7, 31, 0, '60.00', NULL),
(61, '2024-10-27', 1, 11, 0, '10,000.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `quantity` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_id`, `pro_id`, `quantity`) VALUES
(93, 42, 11, 10),
(94, 42, 4, 20),
(95, 43, 16, 7),
(96, 44, 36, 45),
(97, 45, 14, 5),
(98, 45, 2, 45),
(99, 46, 1, 4),
(100, 46, 11, 10),
(101, 47, 12, 7),
(102, 48, 12, 40),
(103, 49, 40, 86),
(104, 50, 40, 10),
(105, 51, 14, 5),
(106, 52, 14, 12),
(107, 53, 4, 74),
(108, 54, 11, 14),
(109, 55, 41, 15),
(110, 56, 41, 7),
(111, 57, 38, 4),
(112, 58, 41, 14),
(113, 59, 41, 4),
(114, 60, 41, 5),
(115, 61, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `man_id` int(11) NOT NULL,
  `pro_name` varchar(25) NOT NULL,
  `pro_desc` text DEFAULT NULL,
  `pro_price` decimal(10,3) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `pro_cat` int(11) NOT NULL,
  `quantity` int(6) DEFAULT NULL,
  `pro_photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `man_id`, `pro_name`, `pro_desc`, `pro_price`, `unit_id`, `pro_cat`, `quantity`, `pro_photo`) VALUES
(1, 11, 'Kanchipuram Saree', '', 5000.000, 3, 1, NULL, 'download (3).jpg'),
(2, 11, 'mull cotton saree', '', 9000.000, 3, 1, NULL, 'download (4).jpg'),
(3, 11, 'Ajarak', '', 250.000, 2, 2, NULL, 'download (14).jpg'),
(4, 11, 'Cotton kurtha', '', 500.000, 1, 2, NULL, 'download (13).jpg'),
(5, 11, 'Straight fit', '', 900.000, 2, 3, NULL, 'download (6).jpg'),
(6, 11, 'Mom fit', '', 1200.000, 2, 3, NULL, 'download (5).jpg'),
(7, 11, 'Pakistani Salwar', '', 2500.000, 2, 4, NULL, 'download (7).jpg'),
(9, 11, 'Wool', '', 500.000, 1, 5, NULL, 'download (10).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `retail`
--

CREATE TABLE `retail` (
  `retail_id` int(11) NOT NULL,
  `retail_username` varchar(25) NOT NULL,
  `retail_password` varchar(250) NOT NULL,
  `retail_address` varchar(200) NOT NULL,
  `area_id` int(11) NOT NULL,
  `retail_phone` varchar(10) NOT NULL,
  `retail_email` varchar(50) DEFAULT NULL,
  `qstn` varchar(200) DEFAULT NULL,
  `ans` varchar(200) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `retail`
--

INSERT INTO `retail` (`retail_id`, `retail_username`, `retail_password`, `retail_address`, `area_id`, `retail_phone`, `retail_email`, `qstn`, `ans`, `status`) VALUES
(1, 'altaf', '0a83a76b4416a4a662ec98912a157ec3', 'A4 Ali Abad Appt, Kajal Park Soci, Sarkhej Road, Ahmedabad', 1, '9978454323', 'altafneva@gmail.com', NULL, NULL, 1),
(2, 'nayan', 'nayan123', 'Opp. Shivalik Complex, Vastrapur, Ahmedabad', 2, '9898906523', 'nayan@gmail.com', NULL, NULL, 1),
(3, 'nishit', 'nishit123', 'B/H Kakariya Lake, Maninagar, Ahmedabad', 3, '8980941941', 'nishit@gmail.com', 'hi', NULL, 1),
(4, 'dharmil', 'b9d20e8b35f4006cc8c6ba4919b82614', 'Near Vejalpur Police Station, Vejalpur, Ahmedabad', 5, '7865340091', 'dharmil123@gmail.com', NULL, NULL, 1),
(5, 'rajesh', 'bf44e33d9745e04551770c7a5a6cdb3b', 'C4-Pushpak Complex, New Ranip, Ahmedabad', 4, '7898902365', 'rajesh123@gmail.com', NULL, NULL, 1),
(6, 'fayas', 'a70ca1454267d4e4fc0bf2f130ba1a74', 'vadakkethalkkal house\r\np.o perinjanam,thrissur,kerala,680686', 3, '0964568545', 'v.jshjmil@gmail.com', NULL, NULL, 1),
(7, 'ankit', 'a70ca1454267d4e4fc0bf2f130ba1a74', '    vadakkethalkkal house\r\np.o perinjanam,thrissur,kerala,680686', 2, '0964568545', 'v.jshejil@gmail.com', '    hlo', '45', 1),
(8, 'new', 'cbb4bfcfaf2342bf8706f144ce9bd5e9', ' vadakkethalkkal house\r\np.o perinjanam,thrissur,kerala,680686', 3, '070 2549 5', 'vjshejmil@gmail.com', 'hi', 'hi', 1),
(9, 'v.js@gma', '7f492d41029aca567f750c21ecb297cd', '  vadakkethalakkal House, p. o perinjanam,', 1, '0964568545', 'v.jshejmil@gmail.com', NULL, NULL, 1),
(11, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', 1, '1111111111', 'test@gmail.com', NULL, NULL, 1),
(14, 'sema', '0192023a7bbd73250516f069df18b500', 'Pokakkilath house p.o perinjanam west \r\nPin 680686', 1, '9632587410', 'seema@gmail.com', NULL, NULL, 1),
(16, 'adm', 'b09c600fddc573f117449b3723f23d64', 'vadakkethalakkal House, p. o perinjanam,', 2, '9645685457', 'vjl@gmail.com', NULL, NULL, 1),
(17, 'reethu', 'd61e8da2216f6e659d98fb5c5a670e9a', 'vadakkethalkkal house\r\np.o perinjanam,thrissur,kerala,680686', 2, '9995655457', 'reethu@gmail.com', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(20) NOT NULL,
  `unit_details` text DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `unit_name`, `unit_details`, `status`) VALUES
(1, 'meter', 'Meter', 1),
(2, 'PCS', 'Pieces', 1),
(3, 'Yard', 'yard', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`dist_id`),
  ADD UNIQUE KEY `dist_phone` (`dist_phone`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `dist_id` (`dist_id`),
  ADD KEY `man_id` (`man_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`man_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `man_email` (`man_email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `retailer_id` (`retailer_id`),
  ADD KEY `man_id` (`man_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `unit` (`unit_id`),
  ADD KEY `pro_cat` (`pro_cat`),
  ADD KEY `man_id` (`man_id`);

--
-- Indexes for table `retail`
--
ALTER TABLE `retail`
  ADD PRIMARY KEY (`retail_id`),
  ADD UNIQUE KEY `retail_username` (`retail_username`),
  ADD UNIQUE KEY `retail_email` (`retail_email`),
  ADD KEY `area_code` (`area_id`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `area_id_2` (`area_id`),
  ADD KEY `area_id_3` (`area_id`),
  ADD KEY `area_id_4` (`area_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`),
  ADD UNIQUE KEY `unit_name` (`unit_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `dist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `man_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `retail`
--
ALTER TABLE `retail`
  MODIFY `retail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
