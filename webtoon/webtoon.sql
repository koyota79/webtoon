-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.10-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- webtoon 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `webtoon` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webtoon`;

-- 테이블 webtoon.tb_item_m 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_item_m` (
  `id` varchar(10) NOT NULL,
  `item_title` varchar(255) NOT NULL,
  `item_type` varchar(8) DEFAULT NULL,
  `use_yn` varchar(1) NOT NULL DEFAULT 'Y',
  `content` text DEFAULT NULL,
  `item_s_dt` datetime DEFAULT NULL,
  `item_e_dt` datetime DEFAULT NULL,
  `delete_flg` varchar(1) DEFAULT 'N',
  `final_yn` varchar(1) DEFAULT 'N',
  `adult_yn` varchar(1) DEFAULT 'N',
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹툰 마스터 테이블';

-- 테이블 데이터 webtoon.tb_item_m:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_item_m` DISABLE KEYS */;
INSERT IGNORE INTO `tb_item_m` (`id`, `item_title`, `item_type`, `use_yn`, `content`, `item_s_dt`, `item_e_dt`, `delete_flg`, `final_yn`, `adult_yn`, `thumbnail`) VALUES
	('WT00000001', '아이도저', 'WT', 'Y', '학교 폭력으로 괴로운 나날을 보내던 \'연우\'가 정체 모를 음악 파일을 접한 후 변하게 되는데', '2018-12-06 20:24:06', '2019-12-06 20:24:13', 'N', 'N', 'N', 'a.jpg'),
	('NV00000001', '라면의 신', 'NOVEL', 'Y', '시에서 제일이라고 손꼽히는 유명한 라면집 ‘간테츠 라면’의 아들이자, 폭주족 우두머리에 말썽꾸러기인 겐다 요시츠네. 어머니의 죽음 그리고 갑작스러운 아버지의 입원으로 ‘간테츠 라면’의 맛을 이어야 하는데… 하지만 천부적으로 라면 맛을 타고난 요시츠네는 아버지의 맛을 넘어서기로 한다! 어느 날, 체인점의 음모에 휘말려 다른 경쟁자들과 라면 승부를 펼치게 ', '2018-12-06 20:42:28', NULL, 'N', 'N', 'N', 'b.jpg'),
	('CM00000001', '가르쳐줘 갸루코짱', 'COMIC', 'Y', '갸루는 헤픈 여자아이. 갸루는 머리가 나빠. 갸루는 화려한 것만 좋아하는 날라리. 갸루라는 단어가 주는 이미지는 이렇다. 그런 이미지를 실체화한 듯 흔하디 흔한 날라리 스타일의 갸루코, 두터운 마음의 벽으로 세상을 따돌리는 오타코, 그야말로 그림으로 그린 듯한 양가집 규수 오죠. 이렇게 전혀 어울리', '2018-12-06 20:43:59', NULL, 'N', 'N', 'N', 'c.jpg'),
	('WT00000002', '노을을 거닐다', 'WT', 'Y', '한 불여우의 장난으로 엮인 남자 구미호와 남자주인공이 천 일 동안 함께 지내면서 벌어지는 BL, 판타지 이야기', '2018-12-30 22:55:26', NULL, 'N', 'N', 'N', 'd.jpg'),
	('WT00000003', '어크로서', 'WT', 'Y', '2025년 ‘혼수병’이 발생하고, 혼수병에 걸린 자는 전생에 갇혀 잠든 채 죽어간다. 이에 인류는 환자의 정신으로 접속할 수 있는 다이버를 양성한다. 인류를 혼수병으로부터 벗어나게 하기 위해 고군분투하는 다이버들의 이야기가 시작된다', '2018-12-30 22:56:49', NULL, 'N', 'N', 'N', 'f.jpg'),
	('WT00000004', '처음뵙겠습니다', 'WT', 'Y', '같은 공간, 다른 시간의 그. 그리고 그녀의 이야기를 그린 로맨스 판타지 메일과 SNS를 매개로 시공간을 넘나드는 남녀의 타임슬립 로맨스 학창시절 겪었던 따돌림으로 현실에 적응하지 못하던 진하에게 미래에서의 메신저가 전달되는데', '2018-12-30 22:59:16', NULL, 'N', 'N', 'N', 'g.jpg'),
	('WT00000005', '사채', 'WT', 'Y', '피도 눈물도 없는 냉혈인간 일수꾼, 나대찬.그리고 그 사채(死債)의 굴레에서 벗어나기 위해 처절히 몸부림치는 채무자들의 생생한 이야기. 어쩌면 당신의 이야기가 될 수도 있다.', '2018-12-30 23:00:50', NULL, 'N', 'N', 'N', 'h.jpg');
/*!40000 ALTER TABLE `tb_item_m` ENABLE KEYS */;

-- 테이블 webtoon.tb_item_s 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_item_s` (
  `item_id` varchar(10) NOT NULL,
  `item_seq` int(4) NOT NULL,
  `item_nm` varchar(125) NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT '00',
  `item_img` varchar(500) DEFAULT NULL,
  `is_free` varchar(1) DEFAULT 'N',
  `free_start_dt` date DEFAULT NULL,
  `up_plan_dt` datetime DEFAULT NULL,
  `coin_price` int(10) DEFAULT NULL,
  `rental_price` int(10) DEFAULT NULL,
  `for_rental` varchar(1) DEFAULT 'N',
  `delete_flg` varchar(1) DEFAULT 'N',
  `create_dt` timestamp NULL DEFAULT current_timestamp(),
  `sort` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹툰 상세 리스트';

-- 테이블 데이터 webtoon.tb_item_s:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_item_s` DISABLE KEYS */;
INSERT IGNORE INTO `tb_item_s` (`item_id`, `item_seq`, `item_nm`, `status`, `item_img`, `is_free`, `free_start_dt`, `up_plan_dt`, `coin_price`, `rental_price`, `for_rental`, `delete_flg`, `create_dt`, `sort`) VALUES
	('WT00000003', 1, '1화', '00', 'no-image.jpg', 'N', NULL, NULL, NULL, NULL, 'N', 'N', '2018-12-31 22:07:40', NULL),
	('WT00000003', 2, '2화', '00', 'no-image.jpg', 'N', NULL, NULL, NULL, NULL, 'N', 'N', '2018-12-31 22:11:19', NULL),
	('WT00000003', 3, '3화', '00', 'no-image.jpg', 'N', NULL, NULL, NULL, NULL, 'N', 'N', '2018-12-31 22:11:32', NULL);
/*!40000 ALTER TABLE `tb_item_s` ENABLE KEYS */;

-- 테이블 webtoon.tb_last_view_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_last_view_history` (
  `user_id` varchar(18) NOT NULL,
  `item_id` varchar(10) NOT NULL,
  `last_item_seq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 webtoon.tb_last_view_history:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_last_view_history` DISABLE KEYS */;
INSERT IGNORE INTO `tb_last_view_history` (`user_id`, `item_id`, `last_item_seq`) VALUES
	('A20181229052201846', 'WT00000001', 1);
/*!40000 ALTER TABLE `tb_last_view_history` ENABLE KEYS */;

-- 테이블 webtoon.tb_users 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_users` (
  `user_id` varchar(100) NOT NULL COMMENT '아이디',
  `login_id` varchar(100) DEFAULT NULL COMMENT '로그인ID',
  `oper_sys` varchar(10) DEFAULT NULL COMMENT '운영체제',
  `password` varchar(100) DEFAULT NULL COMMENT '비밀번호',
  `session_key` varchar(32) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '이메일',
  `receive_sms` varchar(2) DEFAULT 'Y' COMMENT '문자수신여부',
  `receive_email` varchar(2) DEFAULT 'Y' COMMENT '이메일수신여부',
  `hp1` varchar(3) DEFAULT NULL COMMENT '핸드폰1',
  `hp2` varchar(4) DEFAULT NULL COMMENT '핸드폰2',
  `hp3` varchar(4) DEFAULT NULL COMMENT '핸드폰3',
  `level` tinyint(4) DEFAULT 0 COMMENT '회원레벨',
  `adult` varchar(2) DEFAULT 'N' COMMENT '성인여부',
  `last_login_date` datetime DEFAULT NULL COMMENT '최종로그인날짜',
  `in_date` datetime DEFAULT current_timestamp() COMMENT '등록날짜'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원테이블';

-- 테이블 데이터 webtoon.tb_users:~26 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT IGNORE INTO `tb_users` (`user_id`, `login_id`, `oper_sys`, `password`, `session_key`, `email`, `receive_sms`, `receive_email`, `hp1`, `hp2`, `hp3`, `level`, `adult`, `last_login_date`, `in_date`) VALUES
	('A0000000000000001', 'test@test.com', NULL, '1234', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-11-28 23:03:49'),
	('A20181229015246281', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-29 22:52:47'),
	('A20181229035540299', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 00:55:41'),
	('A20181229035648164', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 00:56:49'),
	('A20181229040249325', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:02:50'),
	('A20181229041544970', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:15:46'),
	('A20181229041710918', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:17:12'),
	('A20181229041828804', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:18:29'),
	('A20181229042752023', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:27:53'),
	('A20181229042839910', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:28:40'),
	('A20181229042938938', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:29:40'),
	('A20181229043439430', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:34:40'),
	('A20181229043530511', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:35:31'),
	('A20181229043652590', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:36:53'),
	('A20181229043739774', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:37:40'),
	('A20181229044029779', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:40:30'),
	('A20181229044242652', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:42:43'),
	('A20181229044903717', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:49:05'),
	('A20181229045619061', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 01:56:20'),
	('A20181229050017041', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 02:00:18'),
	('A20181229050838755', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 02:08:39'),
	('A20181229051013545', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 02:10:14'),
	('A20181229051315159', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 02:13:16'),
	('A20181229051425749', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 02:14:26'),
	('A20181229052039846', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 02:20:41'),
	('A20181229052201846', NULL, 'android', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 0, 'N', NULL, '2018-12-30 02:22:02');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
