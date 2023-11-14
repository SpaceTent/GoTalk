-- -------------------------------------------------------------
-- TablePlus 4.8.2(436)
--
-- https://tableplus.com/
--
-- Database: GoTalk
-- Generation Time: 2023-11-14 16:43:18.7950
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `postcodes` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `postcode` varchar(10) DEFAULT NULL,
                             `in_use` varchar(3) DEFAULT NULL,
                             `easting` int(11) DEFAULT NULL,
                             `northing` int(11) DEFAULT NULL,
                             `grid_ref` varchar(255) DEFAULT NULL,
                             `county` varchar(255) DEFAULT NULL,
                             `district` varchar(60) DEFAULT NULL,
                             `ward` varchar(60) DEFAULT NULL,
                             `district_code` varchar(255) DEFAULT NULL,
                             `ward_code` varchar(255) DEFAULT NULL,
                             `country` varchar(255) DEFAULT NULL,
                             `county_code` varchar(255) DEFAULT NULL,
                             `constituency` varchar(255) DEFAULT NULL,
                             `introduced` varchar(255) DEFAULT NULL,
                             `terminated` varchar(255) DEFAULT NULL,
                             `parish` varchar(255) DEFAULT NULL,
                             `national_park` varchar(255) DEFAULT NULL,
                             `population` varchar(10) DEFAULT NULL,
                             `households` varchar(255) DEFAULT NULL,
                             `built_up_area` varchar(255) DEFAULT NULL,
                             `built_up_sub_division` varchar(255) DEFAULT NULL,
                             `lower_layer_super_output_area` varchar(255) DEFAULT NULL,
                             `rural_urban` varchar(255) DEFAULT NULL,
                             `region` varchar(255) DEFAULT NULL,
                             `altitude` int(11) DEFAULT NULL,
                             `london_zone` varchar(255) DEFAULT NULL,
                             `lsoa_code` varchar(255) DEFAULT NULL,
                             `local_authority` varchar(255) DEFAULT NULL,
                             `msoa_code` varchar(255) DEFAULT NULL,
                             `middle_layer_super_output_area` varchar(255) DEFAULT NULL,
                             `parish_code` varchar(255) DEFAULT NULL,
                             `census_output_area` varchar(255) DEFAULT NULL,
                             `constituency_code` varchar(255) DEFAULT NULL,
                             `index_of_multiple_deprivation` int(11) DEFAULT NULL,
                             `quality` int(11) DEFAULT NULL,
                             `user_type` int(11) DEFAULT NULL,
                             `last_updated` varchar(255) DEFAULT NULL,
                             `nearest_station` varchar(255) DEFAULT NULL,
                             `postcode_area` varchar(255) DEFAULT NULL,
                             `postcode_district` varchar(255) DEFAULT NULL,
                             `police_force` varchar(255) DEFAULT NULL,
                             `water_company` varchar(255) DEFAULT NULL,
                             `plus_code` varchar(255) DEFAULT NULL,
                             `average_income` varchar(255) DEFAULT NULL,
                             `sewage_company` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `postcode` (`postcode`) USING BTREE,
                             KEY `wards` (`ward`) USING BTREE,
                             KEY `w2` (`postcode`,`ward`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2630785 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `postcodes` (`id`, `postcode`, `in_use`, `easting`, `northing`, `grid_ref`, `county`, `district`, `ward`, `district_code`, `ward_code`, `country`, `county_code`, `constituency`, `introduced`, `terminated`, `parish`, `national_park`, `population`, `households`, `built_up_area`, `built_up_sub_division`, `lower_layer_super_output_area`, `rural_urban`, `region`, `altitude`, `london_zone`, `lsoa_code`, `local_authority`, `msoa_code`, `middle_layer_super_output_area`, `parish_code`, `census_output_area`, `constituency_code`, `index_of_multiple_deprivation`, `quality`, `user_type`, `last_updated`, `nearest_station`, `postcode_area`, `postcode_district`, `police_force`, `water_company`, `plus_code`, `average_income`, `sewage_company`) VALUES
 (50127, 'B1 1BA', 'Yes', 406875, 286393, 'SP068863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2007-01-01', '', 'Birmingham, unparished area', '', '114', '64', 'West Midlands', 'Birmingham', 'Birmingham 135C', 'Urban major conurbation', 'West Midlands', 130, '', 'E01033615', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00175622', 'E14000564', 10295, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GX+5W', '39300', ''),
 (50142, 'B1 1BY', 'Yes', 406875, 286393, 'SP068863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2007-01-01', '', 'Birmingham, unparished area', '', '110', '67', 'West Midlands', 'Birmingham', 'Birmingham 135C', 'Urban major conurbation', 'West Midlands', 130, '', 'E01033615', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00175622', 'E14000564', 10295, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GX+5W', '39300', ''),
 (50150, 'B1 1DH', 'Yes', 406770, 286103, 'SP067861', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '1980-01-01', '', 'Birmingham, unparished area', '', '126', '83', 'West Midlands', 'Birmingham', 'Birmingham 135D', 'Urban major conurbation', 'West Midlands', 133, '', 'E01033616', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00175626', 'E14000564', 1036, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FX+47', '39300', ''),
 (50209, 'B1 1JW', 'Yes', 406376, 286129, 'SP063861', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2007-08-01', '', 'Birmingham, unparished area', '', '142', '80', 'West Midlands', 'Birmingham', 'Birmingham 134B', 'Urban major conurbation', 'West Midlands', 145, '', 'E01033557', '', 'E02006895', 'Birmingham 134', 'E43000250', 'E00175678', 'E14000564', 13654, 1, 0, '2020-06-03', 'Five Ways', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FR+6X', '36000', ''),
 (50210, 'B1 1JX', 'Yes', 406423, 286163, 'SP064861', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2007-09-01', '', 'Birmingham, unparished area', '', '139', '83', 'West Midlands', 'Birmingham', 'Birmingham 134B', 'Urban major conurbation', 'West Midlands', 146, '', 'E01033557', '', 'E02006895', 'Birmingham 134', 'E43000250', 'E00175718', 'E14000564', 13654, 1, 0, '2020-06-03', 'Five Ways', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FV+87', '36000', ''),
 (50211, 'B1 1JY', 'Yes', 406363, 286172, 'SP063861', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2008-03-01', '', 'Birmingham, unparished area', '', '141', '87', 'West Midlands', 'Birmingham', 'Birmingham 134B', 'Urban major conurbation', 'West Midlands', 146, '', 'E01033557', '', 'E02006895', 'Birmingham 134', 'E43000250', 'E00175678', 'E14000564', 13654, 1, 0, '2020-06-03', 'Five Ways', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FR+9V', '36000', ''),
 (50212, 'B1 1LA', 'Yes', 406552, 286307, 'SP065863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2005-08-01', '', 'Birmingham, unparished area', '', '141', '81', 'West Midlands', 'Birmingham', 'Birmingham 135C', 'Urban major conurbation', 'West Midlands', 146, '', 'E01033615', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00175630', 'E14000564', 10295, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FW+V2', '39300', ''),
 (50219, 'B1 1LJ', 'Yes', 406489, 286282, 'SP064862', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2005-10-01', '', 'Birmingham, unparished area', '', '110', '71', 'West Midlands', 'Birmingham', 'Birmingham 135D', 'Urban major conurbation', 'West Midlands', 146, '', 'E01033616', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00175643', 'E14000564', 1036, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FV+QJ', '39300', ''),
 (50222, 'B1 1LP', 'Yes', 406489, 286282, 'SP064862', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2005-11-01', '', 'Birmingham, unparished area', '', '82', '56', 'West Midlands', 'Birmingham', 'Birmingham 135D', 'Urban major conurbation', 'West Midlands', 146, '', 'E01033616', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00175643', 'E14000564', 1036, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FV+QJ', '39300', ''),
 (50224, 'B1 1LS', 'Yes', 406755, 286522, 'SP067865', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '1980-01-01', '', 'Birmingham, unparished area', '', '88', '58', 'West Midlands', 'Birmingham', 'Birmingham 138A', 'Urban major conurbation', 'West Midlands', 135, '', 'E01033620', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175657', 'E14000564', 9525, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GX+J6', '51600', ''),
 (50227, 'B1 1LW', 'Yes', 406780, 286494, 'SP067864', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2005-11-01', '', 'Birmingham, unparished area', '', '78', '51', 'West Midlands', 'Birmingham', 'Birmingham 138A', 'Urban major conurbation', 'West Midlands', 135, '', 'E01033620', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175657', 'E14000564', 9525, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GX+G9', '51600', ''),
 (50229, 'B1 1LY', 'Yes', 406780, 286494, 'SP067864', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2005-11-01', '', 'Birmingham, unparished area', '', '92', '51', 'West Midlands', 'Birmingham', 'Birmingham 138A', 'Urban major conurbation', 'West Midlands', 135, '', 'E01033620', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175657', 'E14000564', 9525, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GX+G9', '51600', ''),
 (50239, 'B1 1NN', 'Yes', 406360, 286293, 'SP063862', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2001-12-01', '', 'Birmingham, unparished area', '', '86', '58', 'West Midlands', 'Birmingham', 'Birmingham 134B', 'Urban major conurbation', 'West Midlands', 144, '', 'E01033557', '', 'E02006895', 'Birmingham 134', 'E43000250', 'E00175628', 'E14000564', 13654, 1, 0, '2020-06-03', 'Five Ways', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FR+RV', '36000', ''),
 (50263, 'B1 1PW', 'Yes', 406229, 286378, 'SP062863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2006-10-01', '', 'Birmingham, unparished area', '', '83', '57', 'West Midlands', 'Birmingham', 'Birmingham 134B', 'Urban major conurbation', 'West Midlands', 144, '', 'E01033557', '', 'E02006895', 'Birmingham 134', 'E43000250', 'E00175638', 'E14000564', 13654, 1, 0, '2020-06-03', 'Five Ways', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GR+44', '36000', ''),
 (50287, 'B1 1RB', 'Yes', 406495, 286448, 'SP064864', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2000-12-01', '', 'Birmingham, unparished area', '', '104', '62', 'West Midlands', 'Birmingham', 'Birmingham 138D', 'Urban major conurbation', 'West Midlands', 144, '', 'E01033625', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175658', 'E14000564', 20275, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GV+9M', '51600', ''),
 (50291, 'B1 1RG', 'Yes', 406495, 286448, 'SP064864', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2003-07-01', '', 'Birmingham, unparished area', '', '82', '51', 'West Midlands', 'Birmingham', 'Birmingham 138D', 'Urban major conurbation', 'West Midlands', 144, '', 'E01033625', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175658', 'E14000564', 20275, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GV+9M', '51600', ''),
 (50292, 'B1 1RH', 'Yes', 406580, 286388, 'SP065863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2007-05-01', '', 'Birmingham, unparished area', '', '147', '88', 'West Midlands', 'Birmingham', 'Birmingham 135C', 'Urban major conurbation', 'West Midlands', 148, '', 'E01033615', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00175634', 'E14000564', 10295, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GW+55', '39300', ''),
 (50325, 'B1 1TB', 'Yes', 406447, 286530, 'SP064865', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2003-11-01', '', 'Birmingham, unparished area', '', '160', '94', 'West Midlands', 'Birmingham', 'Birmingham 138D', 'Urban major conurbation', 'West Midlands', 136, '', 'E01033625', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175671', 'E14000564', 20275, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GV+M9', '51600', ''),
 (50330, 'B1 1TH', 'Yes', 406447, 286530, 'SP064865', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2003-11-01', '', 'Birmingham, unparished area', '', '147', '87', 'West Midlands', 'Birmingham', 'Birmingham 138D', 'Urban major conurbation', 'West Midlands', 136, '', 'E01033625', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175671', 'E14000564', 20275, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GV+M9', '51600', ''),
 (50337, 'B1 1TS', 'Yes', 406447, 286530, 'SP064865', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2003-11-01', '', 'Birmingham, unparished area', '', '146', '90', 'West Midlands', 'Birmingham', 'Birmingham 138D', 'Urban major conurbation', 'West Midlands', 136, '', 'E01033625', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175671', 'E14000564', 20275, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GV+M9', '51600', ''),
 (50340, 'B1 1TW', 'Yes', 406447, 286530, 'SP064865', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '2003-11-01', '', 'Birmingham, unparished area', '', '109', '64', 'West Midlands', 'Birmingham', 'Birmingham 138D', 'Urban major conurbation', 'West Midlands', 136, '', 'E01033625', '', 'E02006899', 'Birmingham 138', 'E43000250', 'E00175671', 'E14000564', 20275, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3GV+M9', '51600', ''),
 (50345, 'B1 1UB', 'Yes', 406791, 286322, 'SP067863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '1980-01-01', '', 'Birmingham, unparished area', '', '73', '59', 'West Midlands', 'Birmingham', 'Birmingham 135D', 'Urban major conurbation', 'West Midlands', 136, '', 'E01033616', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00046390', 'E14000564', 1036, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FX+WC', '39300', ''),
 (50346, 'B1 1UD', 'Yes', 406791, 286322, 'SP067863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '1980-01-01', '', 'Birmingham, unparished area', '', '80', '61', 'West Midlands', 'Birmingham', 'Birmingham 135D', 'Urban major conurbation', 'West Midlands', 136, '', 'E01033616', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00046390', 'E14000564', 1036, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FX+WC', '39300', ''),
 (50347, 'B1 1UE', 'Yes', 406791, 286322, 'SP067863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '1980-01-01', '', 'Birmingham, unparished area', '', '87', '61', 'West Midlands', 'Birmingham', 'Birmingham 135D', 'Urban major conurbation', 'West Midlands', 136, '', 'E01033616', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00046390', 'E14000564', 1036, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FX+WC', '39300', ''),
 (50348, 'B1 1UF', 'Yes', 406791, 286322, 'SP067863', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '1980-01-01', '', 'Birmingham, unparished area', '', '74', '55', 'West Midlands', 'Birmingham', 'Birmingham 135D', 'Urban major conurbation', 'West Midlands', 136, '', 'E01033616', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00046390', 'E14000564', 1036, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FX+WC', '39300', ''),
 (50349, 'B1 1UG', 'Yes', 406833, 286252, 'SP068862', 'West Midlands', 'Birmingham', 'Ladywood', 'E08000025', 'E05011151', 'England', 'E11000018', 'Birmingham, Ladywood', '1980-01-01', '', 'Birmingham, unparished area', '', '72', '57', 'West Midlands', 'Birmingham', 'Birmingham 135D', 'Urban major conurbation', 'West Midlands', 134, '', 'E01033616', '', 'E02006896', 'Birmingham 135', 'E43000250', 'E00046393', 'E14000564', 1036, 1, 0, '2020-06-03', 'Birmingham New Street', 'B', 'B1', 'West Midlands', 'Severn Trent', '9C4WF3FX+MM', '39300', '')
