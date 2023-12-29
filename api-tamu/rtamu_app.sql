-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2023 at 02:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rtamu_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `nama`, `email`, `password`) VALUES
(1, 'tito', 'tito@gmail.com', '1234567'),
(2, 'toti', '123@gmail.com', '$2y$12$SPyXbdE2Rs37siAa2b7ub.I.Yha0e2vydDASpc.jOwI1SZbOvstAq'),
(3, 'viator', 'viator@look.out.id', '$2y$12$4xH9BpJSl3RToFIMM8e7D.M6n0yVWp6I9jPrUlMHegyOeFOQ4e7V2'),
(4, 'titoo', 'titoo@gmail.com', '$2y$12$qTufq3V29uaP9fZorPZ1hes1TV0Co09BKkdasFEGgZVqgw61VX6qG');

-- --------------------------------------------------------

--
-- Table structure for table `member_token`
--

CREATE TABLE `member_token` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `auth_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_token`
--

INSERT INTO `member_token` (`id`, `member_id`, `auth_key`) VALUES
(1, 2, 'HFAXoiEy4cxUgf5soL1C1WiJnQrPB0wNE83LmotB9DIhKOrkAlUcZlYN8RPp7wI1nqHxlZW7zvz3ip3KmPSG5eLnDvtkwHVyp6Mi'),
(2, 2, 'cyJUBcPGaNeJEvGxDR1UFmp25n7F0xAybjtNi0HsZJSIjNcaP1Sjpy8fExkknkTeatiXoGCXYiEeLCBtP5qnJ0lPsTRNnRl9tIN9'),
(3, 3, 'Sh6B5yk14byAb0RuwATLYZWlDNdzbttAoIYcms2giWW9WGQb2uMKnArYI95G4U4z23QjagXRILdz0Zx29ffF1fH6NjrMNDnKxims'),
(4, 3, 'vKIBPFaqArvelNmbr6DOtbOLTjhUeLNL2HGghHjgevLLcACehgpUCkMuWsaS4qilkfalbzsWMUIf1Tu7LlININGRC6dybhk5YKIf'),
(5, 4, 'uSgNVtSOSDmY99ms9DG4kc28LlBSfGweb153QYPl09E0c6XQhksHiZhZl8HmA6MrQH11XWcWPZHd6rE4a7myl6nZfDHGqEOIdKEv'),
(6, 4, 'TapoNmH57lcafWFdwflMs5o4Qfk7lFOuMXi7rpjpi3tXiK6JmrhuD2V5D9kbaLhaHQRBU3BP0xLspYhRMwymewgvHKrAcrDYWo1q'),
(7, 4, 'AlMAhjLZkPExpUeAlaczUN1ntEj3BfqgEG8B0yWIilUs7ELcF3HDRbUPOizRLQluPpOBNMwSSlNzqByg9KyiKAxaZayMS1Tczkrf'),
(8, 4, 'TPn0lZGpLPOlSIUFkaV4X8sQ65Y86MrOD8LuVVfnnVj7gjaPLFVWNd2VvZeosqdHWDfAsLv80UsHoAxsnnksGXt3Yaseh6XE66MS'),
(9, 4, '2w9YzJP32BQ6vbLCHHCeZJ61tay3Oj84he9emL6GBVVc9qFJtQJP64QNN02RKVUtYRG9ktbOuxEc2X92CYKw7pJmWZYL6SIwjUsZ'),
(10, 4, 'L1ZHQCELWTgxxm95lT704uQiYALiYfDbnqVctZHIbXYKib9os7DjPuNrurRg5F585g6KHj5kFwaQcXjOGRU4e9zs9M8zoUWa5IiP'),
(11, 4, 'NecBNv8ApnlwQrRm4cNHjyAfbo75WOIzCFJju3RALMmGGvZ7yHuZwfyaVOUvuxeMFjJRTP5LyBQSIjdAbiW6RcFF9r4lyAsccNsH'),
(12, 4, 'XSK9tEQcCGuUJPGoOZLk5J4GBCfpVgx6UyE5igx96O5b7A6ejUslJABnsxY1DjzjYXC0sAl1Y2L393wGnLM2RbcmmFL3u32UJJ7P'),
(13, 4, 'N39AfHaNf9LPRsDekqOTCOrrybzakN6VWUFusz60eUc0O8erxmGK8ZBEwL07B6UT6v3PenCHGrvFzP3bY2k5z8atylD8QRH31Ot4'),
(14, 4, 'XdTOJfQjxzAATbg7S1jb5a8HtxMYbmu5vcVPexQYXbnhrkREWGw0Tzh03HxPpJw0DW3xESEqX1i7zgCAl2065wE7ZaWNA798PZ6x'),
(15, 4, 'rSVkfryIjDrdqQfrWnk7n7IqwOBtwgvnNLgiu8CYCVzSD21XCeSAJ5RL54wdqeBKmzptBtOZCadNayTRZNIO5zUu9sPFRAYFuymi'),
(16, 4, 'wAxPJpmHTonuDZjZmAW7qCe0va39a3y4vaOvNHYzbUIEBuROwoaYGiPaK19ehdFA7fDerWqf9BUIzsHKhZsNs15c99oAsCw65PGb'),
(17, 4, 'TTTxXJfPi2TeN2jex88AvwdOD6r6G46GoryFlJEdc9leE2gklt53ojGUZxNEitutfPCrkQHdIHDiZSI4UvYD4ZZBR84VepK3B3gD'),
(18, 4, 'EBNh2dyvgNn9BrdLO0Zt4bWG4QLkeW3ClcYYilVugswf2WiSMsL4bsvjVn95tr611toobSUdcs7biiOOkohvrs5zeE0dlBkbOpfM'),
(19, 4, '1H3Gk84StbrLay4rZcocNDQCnw8NHCbjllAGMPkm5CIMjvQV9LgLbQoZW31tnWm88aMNY9lcDvRByAJM8PeO0zI9VOtrHsk4GTZ3'),
(20, 4, 'kkv15y9bJm9rHJ5CPpSueVatlK2YnbtfvLl6KEHnWyZkDBFuCby2rKRFbiK6JFkWLgHoosJu1w7sp7ZZUQXkP31BabWmMVAxggcP'),
(21, 4, '1UghO9PNkkAfIE83zIKIruorxG5CIKkY2iJMzlKJewP823C9ulnxu7vGB9MyzUgyLCAM6XEqBQktZxUP07sNBFuIj1rll23xUpTA'),
(22, 4, 'tWxDUeT5ss5LfRCFE0wGFvuxPISjcaAUl6ddyvnH128PLhjOrZGMRghqk2TZ0NjbU3ZHyY6kSWCOfP9IZOxosGoO2H6INyaHC1Kj'),
(23, 4, 'VML9vMX7nltWZ2cqt0HwTvFTnaQb52qZFNUFmnX3JkRAVbCEf5MPtCix67CWixfJjOHh8b1rPC5hcS6eboIG08yvMdMSTVdP01hX'),
(24, 4, 'YVBoMUAbABNkzGA9kv8QhuhaJq3a9ZZiuuGR946Sf1Kv4pkfwEzbniNUPdrgk9SRA080TGzvdEHfp6CQALahPhTS8CSF3BNdH9XC'),
(25, 4, 'ckJmkuJsoYvdsRDitwO1rQsRLIIsn7Bezy6gu1LEGcwEtfOVI7KGiil2NPnjLWn8D74iS9G7c9a4MYwBJM0NHQH0h7ItrJbTSYAM');

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jam` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`id`, `nama`, `jam`, `alamat`) VALUES
(2, 'Cyber Security', 'Linux', 'Security Test'),
(11, 'magabut', 'rakus', 'makan haji buta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_token`
--
ALTER TABLE `member_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `member_token`
--
ALTER TABLE `member_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `member_token`
--
ALTER TABLE `member_token`
  ADD CONSTRAINT `member_token_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
