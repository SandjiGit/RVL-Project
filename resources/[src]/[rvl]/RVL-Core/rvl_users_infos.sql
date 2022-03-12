SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `rvl_users_infos` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `bank_pin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `rvl_users_infos`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rvl_users_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;