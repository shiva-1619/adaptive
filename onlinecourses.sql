-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 04, 2024 at 03:58 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecourses`
--
CREATE DATABASE IF NOT EXISTS `onlinecourses` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `onlinecourses`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add student reg model', 7, 'add_studentregmodel'),
(26, 'Can change student reg model', 7, 'change_studentregmodel'),
(27, 'Can delete student reg model', 7, 'delete_studentregmodel'),
(28, 'Can view student reg model', 7, 'view_studentregmodel'),
(29, 'Can add instructor reg model', 8, 'add_instructorregmodel'),
(30, 'Can change instructor reg model', 8, 'change_instructorregmodel'),
(31, 'Can delete instructor reg model', 8, 'delete_instructorregmodel'),
(32, 'Can view instructor reg model', 8, 'view_instructorregmodel'),
(33, 'Can add addourse', 9, 'add_addourse'),
(34, 'Can change addourse', 9, 'change_addourse'),
(35, 'Can delete addourse', 9, 'delete_addourse'),
(36, 'Can view addourse', 9, 'view_addourse'),
(37, 'Can add addcourse', 9, 'add_addcourse'),
(38, 'Can change addcourse', 9, 'change_addcourse'),
(39, 'Can delete addcourse', 9, 'delete_addcourse'),
(40, 'Can view addcourse', 9, 'view_addcourse'),
(41, 'Can add question', 10, 'add_question'),
(42, 'Can change question', 10, 'change_question'),
(43, 'Can delete question', 10, 'delete_question'),
(44, 'Can view question', 10, 'view_question'),
(45, 'Can add cart model', 11, 'add_cartmodel'),
(46, 'Can change cart model', 11, 'change_cartmodel'),
(47, 'Can delete cart model', 11, 'delete_cartmodel'),
(48, 'Can view cart model', 11, 'view_cartmodel'),
(49, 'Can add student courses', 12, 'add_studentcourses'),
(50, 'Can change student courses', 12, 'change_studentcourses'),
(51, 'Can delete student courses', 12, 'delete_studentcourses'),
(52, 'Can view student courses', 12, 'view_studentcourses'),
(53, 'Can add result model', 13, 'add_resultmodel'),
(54, 'Can change result model', 13, 'change_resultmodel'),
(55, 'Can delete result model', 13, 'delete_resultmodel'),
(56, 'Can view result model', 13, 'view_resultmodel'),
(57, 'Can add user test model', 14, 'add_usertestmodel'),
(58, 'Can change user test model', 14, 'change_usertestmodel'),
(59, 'Can delete user test model', 14, 'delete_usertestmodel'),
(60, 'Can view user test model', 14, 'view_usertestmodel'),
(61, 'Can add student feedback', 15, 'add_studentfeedback'),
(62, 'Can change student feedback', 15, 'change_studentfeedback'),
(63, 'Can delete student feedback', 15, 'delete_studentfeedback'),
(64, 'Can view student feedback', 15, 'view_studentfeedback'),
(65, 'Can add descriptive question', 16, 'add_descriptivequestion'),
(66, 'Can change descriptive question', 16, 'change_descriptivequestion'),
(67, 'Can delete descriptive question', 16, 'delete_descriptivequestion'),
(68, 'Can view descriptive question', 16, 'view_descriptivequestion'),
(69, 'Can add image question', 17, 'add_imagequestion'),
(70, 'Can change image question', 17, 'change_imagequestion'),
(71, 'Can delete image question', 17, 'delete_imagequestion'),
(72, 'Can view image question', 17, 'view_imagequestion');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
CREATE TABLE IF NOT EXISTS `cart_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_booking_id` int NOT NULL,
  `cart_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_details_cart_booking_id_77c0b5d0` (`cart_booking_id`),
  KEY `cart_details_cart_user_id_98a1135a` (`cart_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`id`, `cart_booking_id`, `cart_user_id`) VALUES
(2, 4, 4),
(3, 6, 5),
(4, 3, 6),
(5, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `courses_details`
--

DROP TABLE IF EXISTS `courses_details`;
CREATE TABLE IF NOT EXISTS `courses_details` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `course_image` varchar(100) NOT NULL,
  `course_category` varchar(100) NOT NULL,
  `course_language` varchar(100) NOT NULL,
  `course_description` longtext NOT NULL,
  `video_url` varchar(200) NOT NULL,
  `duration_weeks` int NOT NULL,
  `price` int NOT NULL,
  `added_date` date DEFAULT NULL,
  `instructor_id` int NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `Courses_details_instructor_id_48c8e44e` (`instructor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses_details`
--

INSERT INTO `courses_details` (`course_id`, `course_name`, `course_image`, `course_category`, `course_language`, `course_description`, `video_url`, `duration_weeks`, `price`, `added_date`, `instructor_id`) VALUES
(2, 'webdevelopment in 20 days', 'course_images/img8.jpg', 'Web Development', 'English', 'webdevlopment', 'https:// codebook.in/', 5, 1111, '2024-02-23', 8);

-- --------------------------------------------------------

--
-- Table structure for table `descriptivequestions`
--

DROP TABLE IF EXISTS `descriptivequestions`;
CREATE TABLE IF NOT EXISTS `descriptivequestions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` longtext NOT NULL,
  `correct_answer` longtext NOT NULL,
  `question_type` varchar(10) DEFAULT NULL,
  `question_method` varchar(20) NOT NULL,
  `course_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DescriptiveQuestions_course_id_cbfa2919` (`course_id`),
  KEY `DescriptiveQuestions_instructor_id_98bceebb` (`instructor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `descriptivequestions`
--

INSERT INTO `descriptivequestions` (`id`, `question_text`, `correct_answer`, `question_type`, `question_method`, `course_id`, `instructor_id`) VALUES
(1, 'what is web development?', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 'easy', 'descriptive', 2, 8),
(2, 'Explain the difference between HTML and HTML5.', 'HTML is a markup language used for creating the structure of web pages, while HTML5 is the latest version of HTML with additional features like semantic elements, video/audio support, and offline storage.', 'medium', 'descriptive', 2, 8),
(3, 'Describe the purpose of CSS.', 'CSS (Cascading Style Sheets) is used for styling the presentation of web pages. It defines how HTML elements should be displayed, including layout, colors, fonts, and more.', 'medium', 'descriptive', 2, 8),
(4, 'What is JavaScript and its role in web development?', 'JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It enables features like form validation, DOM manipulation, and AJAX requests.', 'medium', 'descriptive', 2, 8),
(5, 'Explain the concept of responsive web design.', 'Responsive web design is an approach to designing websites that ensures optimal viewing and interaction across various devices and screen sizes. It involves using flexible layouts, images, and CSS media queries.', 'medium', 'descriptive', 2, 8),
(6, 'Describe the purpose of server-side programming languages.', 'Server-side programming languages like Python, Ruby, and PHP are used for building dynamic web applications. They handle requests from clients, interact with databases, and generate dynamic content for web pages.', 'medium', 'descriptive', 2, 8),
(7, 'Explain the role of frameworks in web development.', 'Frameworks provide a structured environment and reusable components for building web applications more efficiently. They offer predefined libraries, tools, and conventions to streamline development tasks.', 'medium', 'descriptive', 2, 8),
(8, 'Describe the concept of version control systems.', 'Version control systems like Git enable developers to track changes to their code, collaborate with others, and manage different versions of their projects. They help in maintaining code integrity and facilitating team collaboration.', 'medium', 'descriptive', 2, 8),
(9, 'What is the purpose of a web server?', 'A web server is software that delivers web content to clients over the internet. It processes incoming requests, retrieves and serves web pages, and manages communication between clients and servers.', 'medium', 'descriptive', 2, 8),
(10, 'Explain the role of databases in web development.', 'Databases store and manage data used by web applications. They allow for efficient data storage, retrieval, and manipulation, enabling dynamic content generation and user interactions.', 'medium', 'descriptive', 2, 8),
(11, 'Describe the importance of security in web development.', 'Security is essential in web development to protect sensitive data, prevent unauthorized access, and safeguard against cyber threats. It involves implementing measures like encryption, authentication, and secure coding practices.', 'medium', 'descriptive', 2, 8),
(12, 'What are the advantages of using frameworks like Bootstrap for web development?', 'Frameworks like Bootstrap provide pre-designed and customizable components, responsive grid systems, and built-in CSS and JavaScript functionalities, which help in creating consistent and mobile-friendly web applications with less code.', 'hard', 'descriptive', 2, 8),
(13, 'Explain the concept of web accessibility and its importance in web development.', 'Web accessibility refers to the inclusive practice of ensuring that websites and web applications are usable by people with disabilities. It involves designing and developing digital content in a way that accommodates various disabilities, such as visual, auditory, motor, and cognitive impairments. Web accessibility is crucial in web development as it promotes inclusivity, improves user experience, and enhances the reach and impact of digital content.', 'hard', 'descriptive', 2, 8),
(14, 'What are the principles of Object-Oriented Programming (OOP) and how are they applied in web development?', 'The principles of Object-Oriented Programming (OOP) include encapsulation, inheritance, and polymorphism. In web development, these principles are applied through the use of classes, objects, and methods. Encapsulation ensures data security by bundling data and methods together, inheritance enables code reuse and promotes modularity, and polymorphism allows objects to take on multiple forms and behaviors.', 'hard', 'descriptive', 2, 8),
(15, 'Discuss the concept of RESTful API and its significance in modern web development.', 'RESTful API (Representational State Transfer Application Programming Interface) is an architectural style for designing networked applications. It utilizes HTTP methods such as GET, POST, PUT, and DELETE to perform operations on resources. RESTful APIs are significant in modern web development as they promote interoperability, scalability, and simplicity, enabling communication between different systems and services over the internet.', 'hard', 'descriptive', 2, 8),
(16, 'Explain the concept of asynchronous programming in JavaScript and its application in web development.', 'Asynchronous programming in JavaScript allows tasks to be executed concurrently without blocking the main execution thread. It is commonly used in web development to handle tasks such as fetching data from servers, processing user input, and updating the user interface without freezing or slowing down the application. Asynchronous programming enables responsive and efficient web applications by leveraging non-blocking I/O operations and callbacks.', 'hard', 'descriptive', 2, 8),
(17, 'Discuss the importance of version control systems like Git in collaborative web development projects.', 'Version control systems like Git are essential in collaborative web development projects for managing and tracking changes to source code. They enable multiple developers to work on the same codebase simultaneously, maintain a history of changes, and revert to previous versions if needed. Git facilitates collaboration, ensures code integrity, and streamlines the development process by providing features such as branching, merging, and conflict resolution.', 'hard', 'descriptive', 2, 8),
(18, 'Explain the concept of Single Page Applications (SPAs) and their advantages in web development.', 'Single Page Applications (SPAs) are web applications that dynamically update the content of a single web page in response to user interactions, without the need for page reloads. SPAs utilize technologies such as AJAX and client-side rendering to deliver a seamless and interactive user experience. Their advantages in web development include faster load times, improved performance, and a more fluid and responsive user interface.', 'hard', 'descriptive', 2, 8),
(19, 'Discuss the concept of Progressive Web Apps (PWAs) and their impact on modern web development.', 'Progressive Web Apps (PWAs) are web applications that leverage modern web technologies to provide a native app-like experience to users across various devices and platforms. PWAs offer features such as offline functionality, push notifications, and installation prompts, blurring the line between web and native mobile applications. Their impact on modern web development includes enhanced user engagement, increased conversions, and broader reach, especially in markets with limited internet connectivity.', 'hard', 'descriptive', 2, 8),
(20, 'Explain the concept of Cross-Origin Resource Sharing (CORS) and its role in web development security.', 'Cross-Origin Resource Sharing (CORS) is a security feature implemented in web browsers to prevent unauthorized access to resources across different origins (domains). It defines a set of HTTP headers that allow servers to specify which origins are permitted to access their resources. CORS plays a crucial role in web development security by mitigating the risks associated with cross-origin requests, such as cross-site scripting (XSS) and cross-site request forgery (CSRF), and protecting sensitive data from unauthorized access.', 'hard', 'descriptive', 2, 8),
(21, 'Discuss the concept of serverless architecture and its benefits in modern web development.', 'Serverless architecture, also known as Function-as-a-Service (FaaS), is a cloud computing model where applications are built and deployed without the need to manage servers or infrastructure. In serverless architecture, developers write modular functions that are triggered by events and executed in stateless containers managed by a cloud provider. Serverless computing offers benefits such as scalability, cost-effectiveness, and simplified deployment, allowing developers to focus on writing code and delivering value to users without worrying about server management.', 'hard', 'descriptive', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'userapp', 'studentregmodel'),
(8, 'instructorapp', 'instructorregmodel'),
(9, 'instructorapp', 'addcourse'),
(10, 'instructorapp', 'question'),
(11, 'userapp', 'cartmodel'),
(12, 'userapp', 'studentcourses'),
(13, 'userapp', 'resultmodel'),
(14, 'userapp', 'usertestmodel'),
(15, 'userapp', 'studentfeedback'),
(16, 'instructorapp', 'descriptivequestion'),
(17, 'instructorapp', 'imagequestion');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-22 09:28:05.784981'),
(2, 'auth', '0001_initial', '2024-02-22 09:28:06.289578'),
(3, 'admin', '0001_initial', '2024-02-22 09:28:06.444192'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-22 09:28:06.451433'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-22 09:28:06.457064'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-02-22 09:28:06.529930'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-02-22 09:28:06.565566'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-02-22 09:28:06.604356'),
(9, 'auth', '0004_alter_user_username_opts', '2024-02-22 09:28:06.610362'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-02-22 09:28:06.644176'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-02-22 09:28:06.645758'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-02-22 09:28:06.651588'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-02-22 09:28:06.685819'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-02-22 09:28:06.719389'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-02-22 09:28:06.749733'),
(16, 'auth', '0011_update_proxy_permissions', '2024-02-22 09:28:06.759161'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-02-22 09:28:06.789826'),
(18, 'sessions', '0001_initial', '2024-02-22 09:28:06.823549'),
(19, 'userapp', '0001_initial', '2024-02-22 09:28:06.834799'),
(20, 'userapp', '0002_delete_studentregmodel', '2024-02-22 09:28:06.841100'),
(21, 'userapp', '0003_initial', '2024-02-22 09:28:06.851061'),
(22, 'userapp', '0004_studentregmodel_otp_studentregmodel_otp_status', '2024-02-22 09:39:19.234265'),
(23, 'instructorapp', '0001_initial', '2024-02-22 10:58:25.583417'),
(24, 'instructorapp', '0002_addourse', '2024-02-22 11:58:27.428559'),
(25, 'instructorapp', '0003_addourse_added_date', '2024-02-22 11:59:51.894793'),
(26, 'instructorapp', '0004_rename_addourse_addcourse', '2024-02-22 12:04:44.646493'),
(27, 'instructorapp', '0005_question', '2024-02-23 05:55:44.229155'),
(28, 'userapp', '0005_cartmodel', '2024-02-23 07:15:18.626092'),
(29, 'userapp', '0006_studentcourses', '2024-02-23 07:34:48.179102'),
(30, 'userapp', '0007_remove_studentcourses_course_and_more', '2024-02-23 08:14:11.107516'),
(31, 'instructorapp', '0006_remove_question_course_remove_question_instructor_and_more', '2024-02-23 08:14:11.261590'),
(32, 'instructorapp', '0007_addcourse_question', '2024-02-23 08:14:35.518271'),
(33, 'userapp', '0008_cartmodel_studentcourses', '2024-02-23 08:14:35.942846'),
(34, 'instructorapp', '0008_alter_addcourse_price', '2024-02-23 08:44:39.490615'),
(35, 'userapp', '0009_resultmodel_usertestmodel', '2024-02-23 11:20:34.289680'),
(36, 'userapp', '0010_studentfeedback', '2024-02-24 12:28:08.795073'),
(37, 'instructorapp', '0009_question_question_type', '2024-02-26 06:22:13.391139'),
(38, 'instructorapp', '0010_question_question_method_descriptivequestion', '2024-02-28 18:01:41.407049'),
(39, 'instructorapp', '0011_imagequestion', '2024-02-28 18:03:33.212629'),
(40, 'userapp', '0011_alter_resultmodel_useranswer', '2024-03-01 13:06:00.778266'),
(41, 'userapp', '0012_alter_resultmodel_correctanswer_and_more', '2024-03-02 07:24:23.091950');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('b21wabwskmp4q91xcoq16y390yj3kgp1', '.eJyrViouKU1JzSuJz0xRsjLRQeLGJ6aVpBbF5-SnZ-aBpTLziiGqagEeLBMs:1rd76l:3EsUf_KG6SSFU_FuSq0Elz6kl0BIujmXFslKoBTYf94', '2024-03-07 11:19:19.119220'),
('2r7wa0jytp1eqxg54hrplr3qj5z3owzi', 'eyJpbnNfaWQiOjgsImluc19pZF9hZnRlcl9sb2dpbiI6OH0:1rd7sN:a87qfLEb97tIQY23IA33m1WkV1M3ygzmw3APLNyn3mI', '2024-03-07 12:08:31.810171'),
('47znfrbemd00pxu4fyowx8ke0h7npb40', 'eyJzdHVkZW50X2lkX2FmdGVyX2xvZ2luIjo0fQ:1rdOts:aRM1UA-FOhg325PcJ__d2WD3B6VYdfqSPOGLssy0yz8', '2024-03-08 06:19:12.670507'),
('73qmc7p7tpajtqbzqzyess7m147pc0p2', 'eyJzdHVkZW50X2lkX2FmdGVyX2xvZ2luIjo0LCJjb3Vyc2VfaWRfaW5fcHVyY2hhc2VfcGFnZSI6MX0:1rdQvt:0XezNSMaSJMxlNbNxE7OXyh3qYLAzlfkyHHN_GBf13Y', '2024-03-08 08:29:25.119860'),
('9x0e582hi7h50x45g7t421386bxreww3', 'eyJzdHVkZW50X2lkX2FmdGVyX2xvZ2luIjo0LCJjb3Vyc2VfaWRfaW5fcHVyY2hhc2VfcGFnZSI6Mn0:1rdRH9:JK02G_ifXVTBLSECKMjhVUiRUUoWKnHMmOsByg1dTp0', '2024-03-08 08:51:23.088827'),
('hzg852ehrbhe8zi5gftahcv1lt1y81b7', 'eyJzdHVkZW50X2lkX2FmdGVyX2xvZ2luIjo0fQ:1rdRR0:OFNLwVYyMqJMYTKDlMNbdY9qMIUZtT64Mt-HEYWNP6o', '2024-03-08 09:01:34.961821'),
('7upz1sdlp2rym1ka4e44726yiiqlg0vz', 'eyJzdHVkZW50X2lkX2FmdGVyX2xvZ2luIjo0fQ:1rdRrD:sjl3xbeNYzRGf8EKtcJUrcHJ2jhJADlDRPHGMn72v-Y', '2024-03-08 09:28:39.765683'),
('b0arpdffeclk2o2j5n777xny25jypo95', 'eyJzdHVkZW50X2lkX2FmdGVyX2xvZ2luIjo1fQ:1rdTJs:6xPTqsmNPDgpo9faNTehEZspqaOWaJWjdNqtpsoIikE', '2024-03-08 11:02:20.430099'),
('v9uye3zi0ex7v5nwvktta65kerace6qm', 'eyJzdHVkZW50X2lkX2FmdGVyX2xvZ2luIjo1fQ:1rdTp3:U57CDLQtrsvTYYkS99mKfb10ERf0WzTUamEPCzm3oSc', '2024-03-08 11:34:33.470810'),
('xlnsmz5sp9n3te56s9lm7c7m523ox6eb', 'eyJzdHVkZW50X2lkX2FmdGVyX2xvZ2luIjo1LCJjb3Vyc2VfaWQiOjIsImFuc3dlcmVkX3F1ZXN0aW9ucyI6W10sInVzZXJfdGVzdF9pZCI6MTk5fQ:1rgKMU:AsLWr5OQaA1L2SK6texf3nfVj_M7RU69BUb828p4lK8', '2024-03-16 08:04:50.586363');

-- --------------------------------------------------------

--
-- Table structure for table `imagequestions`
--

DROP TABLE IF EXISTS `imagequestions`;
CREATE TABLE IF NOT EXISTS `imagequestions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `correct_answer` longtext NOT NULL,
  `question_type` varchar(10) DEFAULT NULL,
  `question_method` varchar(20) NOT NULL,
  `course_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ImageQuestions_course_id_1ee8181d` (`course_id`),
  KEY `ImageQuestions_instructor_id_e0882bf8` (`instructor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagequestions`
--

INSERT INTO `imagequestions` (`id`, `question_text`, `image`, `correct_answer`, `question_type`, `question_method`, `course_id`, `instructor_id`) VALUES
(7, 'describe the image ? ', 'image_questions/1img.webp', 'The fisherman stood firm on the rocky shoreline, the rhythmic sound of crashing waves providing a soothing backdrop as he patiently waited for a tug on his line.', 'easy', 'image', 2, 8),
(6, 'this is image question 2', 'image_questions/dd1_AecgPhD.png', 'answer', 'medium', 'image', 2, 8),
(5, 'who is the person above ?', 'image_questions/testimonial-2.jpg', 'he is just a normal happy person ', 'hard', 'image', 2, 8),
(8, 'describe image ?', 'image_questions/2img.jpg', 'With boundless energy and unwavering focus, the playful dog darted across the grassy field, joyously retrieving the tennis ball thrown by its owner.', 'medium', 'image', 2, 8),
(9, 'Describe image ?', 'image_questions/3img.jpg', 'In the golden glow of the setting sun, the lone cricketer practiced his shots on the grassy pitch, each powerful stroke sending the ball soaring through the air, a testament to his dedication and love for the game.', 'hard', 'image', 2, 8),
(10, 'who is he ?', 'image_questions/4img.webp', 'Virat Kohli, born on November 5, 1988, in Delhi, India, is a prolific Indian cricketer known for his aggressive batting style and remarkable consistency across all formats. He has broken numerous records in international cricket and has captained the Indian cricket team in all formats.', 'medium', 'image', 2, 8),
(11, 'Describe Image ?', 'image_questions/5img.jpg', '\r\nIn the silent expanse of the empty movie theatre, rows of vacant seats await their audience, the flickering screen the sole source of illumination in the dimly lit hall, a poignant reminder of the absence of laughter and applause.', 'medium', 'image', 2, 8),
(12, 'explain what you see ?', 'image_questions/chat1.webp', 'it is image of chat bot ,  which is looking like a robot !', 'hard', 'image', 2, 8),
(13, 'describe image ?', 'image_questions/robotic-surgeon-doctor-illustration_82574-12977.png', 'it is image of doctor it is most likely  to be vector image ', 'hard', 'image', 2, 8),
(14, 'what do you see?', 'image_questions/colors.png', 'it is color palette of colors rerlated to grey or black color !', 'medium', 'image', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_details`
--

DROP TABLE IF EXISTS `instructor_details`;
CREATE TABLE IF NOT EXISTS `instructor_details` (
  `instructor_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(55) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` bigint DEFAULT NULL,
  `gender` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `otp_status` varchar(15) NOT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor_details`
--

INSERT INTO `instructor_details` (`instructor_id`, `full_name`, `email`, `phone_number`, `gender`, `password`, `photo`, `status`, `reg_date`, `address`, `otp`, `otp_status`) VALUES
(8, 'Upender Bala', 'upenderbala25@gmail.com', 9666473716, 'False', '1', 'dd1_nWpTKoZ.png', 'Accepted', '2024-02-22', 'lb nagar', '8120', 'Verified'),
(9, 'sindhu', 'sindhu@gmail.com', 9666473716, 'False', '1', 'course-3.jpg', 'Accepted', '2024-02-23', 'lb nagar', '6964', 'Verified'),
(11, 'newins', 'mail@gmail.com', 1234566778, 'False', '1', 'dd1_nWpTKoZ_4sRhceI.png', 'Accepted', '2024-02-27', 'lb', '2277', 'Verified');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` longtext NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `course_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `question_type` varchar(10) DEFAULT NULL,
  `question_method` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Questions_course_id_961ecdde` (`course_id`),
  KEY `Questions_instructor_id_b352cb11` (`instructor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `course_id`, `instructor_id`, `question_type`, `question_method`) VALUES
(116, 'What does HTML stand for?', 'Hyper Text Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language', 'Hyper Text Makeup Language', 'Hyper Text Markup Language', 2, 8, 'easy', 'mcqs'),
(117, 'Which of the following is not a programming language?', 'HTML', 'Java', 'Python', 'C++', 'HTML', 2, 8, 'easy', 'mcqs'),
(118, 'What is the latest version of HTML?', 'HTML4', 'HTML5', 'XHTML', 'HTMLX', 'HTML5', 2, 8, 'easy', 'mcqs'),
(119, 'What is the correct HTML element for inserting a line break?', '<br>', '<lb>', '<break>', '<line>', '<br>', 2, 8, 'easy', 'mcqs'),
(120, 'Which HTML attribute is used to define inline styles?', 'style', 'class', 'font', 'color', 'style', 2, 8, 'easy', 'mcqs'),
(121, 'What is the correct HTML for making a hyperlink?', '<a href=\"https://www.example.com\">Click here</a>', '<link>https://www.example.com</link>', '<a>https://www.example.com</a>', '<href=\"https://www.example.com\">Click here</href>', '<a href=\"https://www.example.com\">Click here</a>', 2, 8, 'easy', 'mcqs'),
(122, 'Which character is used to indicate an end tag in HTML?', '/', '.', '!', '?', '/', 2, 8, 'easy', 'mcqs'),
(123, 'What is the correct HTML for inserting an image?', '<img src=\"image.jpg\" alt=\"MyImage\">', '<image src=\"image.jpg\" alt=\"MyImage\">', '<img alt=\"MyImage\">image.jpg</img>', '<img>image.jpg</img>', '<img src=\"image.jpg\" alt=\"MyImage\">', 2, 8, 'easy', 'mcqs'),
(124, 'What does CSS stand for?', 'Creative Style Sheets', 'Cascading Style Sheets', 'Colorful Style Sheets', 'Computer Style Sheets', 'Cascading Style Sheets', 2, 8, 'easy', 'mcqs'),
(125, 'Which property is used to change the background color?', 'background-color', 'color', 'bgcolor', 'background', 'background-color', 2, 8, 'easy', 'mcqs'),
(126, 'What is the purpose of the alt attribute in an HTML image tag?', 'It provides alternative text for search engines.', 'It specifies the alignment of the image.', 'It specifies the image source.', 'It provides alternative text for screen readers.', 'It provides alternative text for screen readers.', 2, 8, 'medium', 'mcqs'),
(127, 'What does the CSS property \"float\" do?', 'It specifies the position of an element relative to its normal position.', 'It specifies the alignment of an element.', 'It specifies whether an element should be visible or hidden.', 'It specifies the alignment of text within an element.', 'It specifies the position of an element relative to its normal position.', 2, 8, 'medium', 'mcqs'),
(128, 'What is the purpose of the JavaScript \"this\" keyword?', 'It refers to the current object.', 'It refers to the parent of the current object.', 'It refers to the previous object.', 'It refers to the next object.', 'It refers to the current object.', 2, 8, 'medium', 'mcqs'),
(129, 'What is the difference between == and === operators in JavaScript?', '== performs type conversion, while === does not.', '== performs strict comparison, while === does not.', '== performs strict comparison, while === performs type conversion.', '== performs type conversion, while === performs strict comparison.', '== performs type conversion, while === performs strict comparison.', 2, 8, 'medium', 'mcqs'),
(130, 'What is the purpose of the HTML \"meta\" tag?', 'It specifies the character encoding for the document.', 'It specifies the location of the document.', 'It specifies the author of the document.', 'It specifies the title of the document.', 'It specifies the character encoding for the document.', 2, 8, 'medium', 'mcqs'),
(131, 'What is the purpose of the CSS property \"position: relative;\"?', 'It positions an element relative to its normal position.', 'It positions an element relative to the viewport.', 'It positions an element absolutely within its container.', 'It positions an element absolutely within the document.', 'It positions an element relative to its normal position.', 2, 8, 'medium', 'mcqs'),
(132, 'What is the purpose of the JavaScript \"setTimeout\" function?', 'It executes a function repeatedly at specified intervals.', 'It executes a function after a specified delay.', 'It executes a function at the end of the current event loop iteration.', 'It executes a function immediately.', 'It executes a function after a specified delay.', 2, 8, 'medium', 'mcqs'),
(133, 'What is the purpose of the CSS property \"z-index\"?', 'It specifies the z-coordinate of an element.', 'It specifies the stacking order of an element.', 'It specifies the opacity of an element.', 'It specifies the order of elements in a flex container.', 'It specifies the stacking order of an element.', 2, 8, 'medium', 'mcqs'),
(134, 'What does the HTML5 \"canvas\" element allow for?', 'It allows for drawing graphics and animations.', 'It allows for creating structured documents.', 'It allows for creating interactive forms.', 'It allows for embedding multimedia content.', 'It allows for drawing graphics and animations.', 2, 8, 'medium', 'mcqs'),
(135, 'What is the purpose of the JavaScript \"addEventListener\" method?', 'It adds an event listener to an element.', 'It removes an event listener from an element.', 'It triggers an event on an element.', 'It handles an event on an element.', 'It adds an event listener to an element.', 2, 8, 'medium', 'mcqs'),
(136, 'Explain the concept of CORS (Cross-Origin Resource Sharing) in web development.', 'It is a security feature that restricts resources from being requested from another domain.', 'It is a mechanism that allows resources to be requested from another domain regardless of the origin.', 'It is a protocol for securely transferring data between the client and server.', 'It is a method for encrypting data transmitted between the client and server.', 'It is a security feature that restricts resources from being requested from another domain.', 2, 8, 'hard', 'mcqs'),
(137, 'Describe the purpose and usage of the HTML \"data-\" attribute.', 'It is used to store custom data attributes for elements.', 'It is used to specify the primary language of the document.', 'It is used to define the structure of a table.', 'It is used to provide alternative text for images.', 'It is used to store custom data attributes for elements.', 2, 8, 'hard', 'mcqs'),
(138, 'Explain the concept of event bubbling and event capturing in JavaScript.', 'Event bubbling refers to the propagation of events from child to parent elements, while event capturing refers to the propagation from parent to child elements.', 'Event bubbling refers to the propagation of events from parent to child elements, while event capturing refers to the propagation from child to parent elements.', 'Event bubbling and event capturing are synonymous and refer to the same process.', 'Event bubbling refers to the handling of events in sequential order, while event capturing refers to handling events concurrently.', 'Event bubbling refers to the propagation of events from child to parent elements, while event capturing refers to the propagation from parent to child elements.', 2, 8, 'hard', 'mcqs'),
(139, 'Discuss the differences between GET and POST methods in HTTP requests.', 'GET method is used for sending small amounts of data, while POST method is used for sending large amounts of data.', 'GET method appends data to the URL, while POST method sends data in the request body.', 'GET method is less secure than POST method.', 'GET method is asynchronous, while POST method is synchronous.', 'GET method appends data to the URL, while POST method sends data in the request body.', 2, 8, 'hard', 'mcqs'),
(140, 'Explain the purpose of the CSS \"box-sizing\" property and its possible values.', 'The \"box-sizing\" property defines how the total width and height of an element is calculated.', 'The \"box-sizing\" property determines the spacing between elements.', 'The \"box-sizing\" property specifies the display behavior of an element.', 'The \"box-sizing\" property sets the background color of an element.', 'The \"box-sizing\" property defines how the total width and height of an element is calculated.', 2, 8, 'hard', 'mcqs'),
(141, 'Describe the differences between CSS Grid Layout and CSS Flexbox Layout.', 'CSS Grid Layout is one-dimensional, while CSS Flexbox Layout is two-dimensional.', 'CSS Grid Layout is more suitable for complex layouts, while CSS Flexbox Layout is more suitable for simpler layouts.', 'CSS Grid Layout allows for more precise control over layout, while CSS Flexbox Layout is more flexible in handling content alignment.', 'CSS Grid Layout is more widely supported by older browsers compared to CSS Flexbox Layout.', 'CSS Grid Layout allows for more precise control over layout, while CSS Flexbox Layout is more flexible in handling content alignment.', 2, 8, 'hard', 'mcqs'),
(142, 'Explain the concept of \"callback hell\" in JavaScript and how it can be mitigated.', 'Callback hell refers to the nesting of multiple callback functions, leading to code that is difficult to read and maintain.', 'Callback hell is a term used to describe the performance degradation caused by excessive use of callback functions.', 'Callback hell is a security vulnerability in JavaScript applications.', 'Callback hell is a feature of JavaScript that allows for asynchronous programming.', 'Callback hell refers to the nesting of multiple callback functions, leading to code that is difficult to read and maintain.', 2, 8, 'hard', 'mcqs'),
(143, 'Discuss the advantages and disadvantages of using a CSS preprocessor such as Sass or Less.', 'Advantages include improved code organization and maintainability, while disadvantages include a learning curve and increased compilation time.', 'Advantages include faster development and reduced file size, while disadvantages include browser compatibility issues.', 'Advantages include better performance and increased security, while disadvantages include limited browser support.', 'Advantages include easier debugging and better documentation, while disadvantages include lack of community support.', 'Advantages include improved code organization and maintainability, while disadvantages include a learning curve and increased compilation time.', 2, 8, 'hard', 'mcqs'),
(144, 'Explain the purpose and usage of the HTML \"meta\" tag with the \"viewport\" attribute.', 'The \"viewport\" attribute of the \"meta\" tag controls the layout and scaling of the viewport on mobile devices.', 'The \"viewport\" attribute of the \"meta\" tag specifies the character encoding of the document.', 'The \"viewport\" attribute of the \"meta\" tag specifies the author of the document.', 'The \"viewport\" attribute of the \"meta\" tag specifies the primary language of the document.', 'The \"viewport\" attribute of the \"meta\" tag controls the layout and scaling of the viewport on mobile devices.', 2, 8, 'hard', 'mcqs'),
(145, 'Discuss the concept of \"object-oriented programming\" (OOP) and its relevance in web development.', 'OOP is a programming paradigm based on the concept of \"objects,\" which can contain data in the form of fields and code in the form of procedures.', 'OOP is a programming paradigm that emphasizes procedural programming and code reusability.', 'OOP is a programming technique used exclusively for front-end development.', 'OOP is a programming technique used exclusively for back-end development.', 'OOP is a programming paradigm based on the concept of \"objects,\" which can contain data in the form of fields and code in the form of procedures.', 2, 8, 'hard', 'mcqs');

-- --------------------------------------------------------

--
-- Table structure for table `student_courses_details`
--

DROP TABLE IF EXISTS `student_courses_details`;
CREATE TABLE IF NOT EXISTS `student_courses_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `payment_id` varchar(200) NOT NULL,
  `order_id` varchar(200) NOT NULL,
  `course_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_courses_details_course_id_19b51a85` (`course_id`),
  KEY `student_courses_details_student_id_e541b9d6` (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_courses_details`
--

INSERT INTO `student_courses_details` (`id`, `amount`, `payment_status`, `purchase_date`, `payment_id`, `order_id`, `course_id`, `student_id`) VALUES
(1, 1111, 'Successful', '2024-02-23', 'pay_NeGuO2V05zbEMZ', 'order_NeGu6gGqN62Q2A', 2, 4),
(6, 1111, 'Successful', '2024-02-24', 'pay_NegE1Dqmjvh9Rh', 'order_NegDiqCodLHNsY', 2, 5),
(7, 1111, 'Successful', '2024-02-24', 'pay_NenCLEp0cDWBLN', 'order_NenBq4ipvKpqmg', 2, 6),
(10, 1111, 'Successful', '2024-02-27', 'pay_NftDUk0nXkZogT', 'order_NftD5SjofwaIJn', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
CREATE TABLE IF NOT EXISTS `student_details` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` bigint NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `otp_status` varchar(15) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`student_id`, `full_name`, `email`, `phone_number`, `photo`, `password`, `reg_date`, `address`, `otp`, `otp_status`) VALUES
(5, 'newstudent2', 'upenderbala25@gmail.com', 9666473716, 'images/testimonial-2_e5rPNz8.jpg', '1', '2024-02-23', 'lb', '3238', 'Verified'),
(4, 'Upender Bala', 'upenderimp25@gmail.com', 9666473716, 'images/testimonial-4_sCrN8to.jpg', '1', '2024-02-22', 'hytnagar', '5277', 'Verified'),
(6, 'newstudent', 'example@gmail.com', 1234567893, 'images/carousel-1.jpg', '1', '2024-02-24', 'hayathnagar', '2799', 'Verified'),
(8, 'newuser', 'newmail@gmail.com', 1234567896, 'images/course-3.jpg', '12', '2024-02-27', 'lb', '1179', 'Verified');

-- --------------------------------------------------------

--
-- Table structure for table `student_feedback`
--

DROP TABLE IF EXISTS `student_feedback`;
CREATE TABLE IF NOT EXISTS `student_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `rating` int NOT NULL,
  `additional_comments` longtext NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_feedback_student_id_d8d2dddf` (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_feedback`
--

INSERT INTO `student_feedback` (`id`, `course_name`, `user_name`, `user_email`, `rating`, `additional_comments`, `submitted_at`, `student_id`) VALUES
(4, 'webdevelopment in 20 days', 'upender', 'upenderbala25@gmail.com', 2, 'ok', '2024-02-24 16:59:44.631193', 5),
(5, 'webdevelopment in 20 days', 'upender', 'example@gmail.com', 4, 'ok', '2024-02-24 17:06:43.155899', 6),
(6, 'webdevelopment in 20 days', 'user', 'example@gmail.com', 2, 'good', '2024-02-27 11:38:22.244338', 8);

-- --------------------------------------------------------

--
-- Table structure for table `student_result_details`
--

DROP TABLE IF EXISTS `student_result_details`;
CREATE TABLE IF NOT EXISTS `student_result_details` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `test_id` int DEFAULT NULL,
  `test_name` varchar(509) NOT NULL,
  `question` varchar(999) NOT NULL,
  `useranswer` varchar(999) DEFAULT NULL,
  `correctanswer` varchar(999) NOT NULL,
  `marks` int NOT NULL,
  `result_date` date DEFAULT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=MyISAM AUTO_INCREMENT=833 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_result_details`
--

INSERT INTO `student_result_details` (`result_id`, `user_id`, `test_id`, `test_name`, `question`, `useranswer`, `correctanswer`, `marks`, `result_date`) VALUES
(624, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'What is the purpose of the CSS property \"position: relative;\"?', 'It positions an element relative to its normal position', 'It positions an element relative to its normal position', 1, '2024-03-02'),
(623, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'Which character is used to indicate an end tag in HTML?', '/', '/', 1, '2024-03-02'),
(622, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'Which property is used to change the background color?', 'background-color', 'background-color', 1, '2024-03-02'),
(621, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'Describe the purpose of CSS.', 'css is used to stying the wepages', 'CSS (Cascading Style Sheets) is used for styling the pr', 0, '2024-03-02'),
(620, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'Describe the purpose of CSS.', 'css is used to stying the wepages', 'CSS (Cascading Style Sheets) is used for styling the pr', 0, '2024-03-02'),
(619, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'this is image question 2', 'this is related to the sign of arrows side check', 'answer', 0, '2024-03-02'),
(618, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'what is web development?', 'Web development types have been classified into front-e', 'Web development types have been classified into front-e', 1, '2024-03-02'),
(617, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'What does HTML stand for?', 'Hyper Text Markup Language', 'Hyper Text Markup Language', 1, '2024-03-02'),
(616, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'What is the purpose of the CSS property \"z-index\"?', 'It specifies the z-coordinate of an element.', 'It specifies the stacking order of an element.', 0, '2024-03-02'),
(615, 5, 184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', 'What is the purpose of the CSS property \"z-index\"?', 'It specifies the z-coordinate of an element.', 'It specifies the stacking order of an element.', 0, '2024-03-02'),
(614, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'Explain the concept of \"callback hell\" in JavaScript and how it can be mitigated.', 'Callback hell refers to the nesting of multiple callbac', 'Callback hell refers to the nesting of multiple callbac', 1, '2024-03-02'),
(613, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'Explain the purpose and usage of the HTML \"meta\" tag with the \"viewport\" attribute.', 'The \"viewport\" attribute of the \"meta\" tag controls the', 'The \"viewport\" attribute of the \"meta\" tag controls the', 1, '2024-03-02'),
(612, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'Describe the purpose and usage of the HTML \"data-\" attribute.', 'It is used to store custom data attributes for elements', 'It is used to store custom data attributes for elements', 1, '2024-03-02'),
(611, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'Discuss the differences between GET and POST methods in HTTP requests.', 'GET method is used for sending small amounts of data, w', 'GET method appends data to the URL, while POST method s', 0, '2024-03-02'),
(610, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'Explain the purpose of the CSS \"box-sizing\" property and its possible values.', 'The \"box-sizing\" property defines how the total width a', 'The \"box-sizing\" property defines how the total width a', 1, '2024-03-02'),
(609, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'Describe the differences between CSS Grid Layout and CSS Flexbox Layout.', 'CSS Grid Layout is one-dimensional, while CSS Flexbox L', 'CSS Grid Layout allows for more precise control over la', 0, '2024-03-02'),
(608, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'Explain the concept of CORS (Cross-Origin Resource Sharing) in web development.', 'It is a security feature that restricts resources from ', 'It is a security feature that restricts resources from ', 1, '2024-03-02'),
(607, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'Discuss the concept of \"object-oriented programming\" (OOP) and its relevance in web development.', 'OOP is a programming paradigm based on the concept of \"', 'OOP is a programming paradigm based on the concept of \"', 1, '2024-03-02'),
(606, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'What is the purpose of the JavaScript \"this\" keyword?', 'It refers to the current object.', 'It refers to the current object.', 1, '2024-03-02'),
(605, 5, 183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', 'What is the purpose of the CSS property \"position: relative;\"?', 'It positions an element relative to its normal position', 'It positions an element relative to its normal position', 1, '2024-03-02'),
(604, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'Discuss the concept of \"object-oriented programming\" (OOP) and its relevance in web development.', 'OOP is a programming technique used exclusively for bac', 'OOP is a programming paradigm based on the concept of \"', 0, '2024-03-02'),
(603, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'Explain the purpose and usage of the HTML \"meta\" tag with the \"viewport\" attribute.', 'The \"viewport\" attribute of the \"meta\" tag specifies th', 'The \"viewport\" attribute of the \"meta\" tag controls the', 0, '2024-03-02'),
(602, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'Discuss the differences between GET and POST methods in HTTP requests.', 'GET method appends data to the URL, while POST method s', 'GET method appends data to the URL, while POST method s', 1, '2024-03-02'),
(601, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'Explain the purpose of the CSS \"box-sizing\" property and its possible values.', 'The \"box-sizing\" property defines how the total width a', 'The \"box-sizing\" property defines how the total width a', 1, '2024-03-02'),
(600, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'What is the difference between == and === operators in JavaScript?', '== performs type conversion, while === performs strict ', '== performs type conversion, while === performs strict ', 1, '2024-03-02'),
(599, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'What is the correct HTML for inserting an image?', '<img src=\"image.jpg\" alt=\"MyImage\">', '<img src=\"image.jpg\" alt=\"MyImage\">', 1, '2024-03-02'),
(598, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'Which character is used to indicate an end tag in HTML?', '/', '/', 1, '2024-03-02'),
(597, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'Describe the importance of security in web development.', '2', 'Security is essential in web development to protect sen', 0, '2024-03-02'),
(596, 5, 182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', 'Explain the difference between HTML and HTML5.', '1\r\n', 'HTML is a markup language used for creating the structu', 0, '2024-03-02'),
(595, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'What is the correct HTML for inserting an image?', '<img src=\"image.jpg\" alt=\"MyImage\">', '<img src=\"image.jpg\" alt=\"MyImage\">', 1, '2024-03-02'),
(594, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'Which HTML attribute is used to define inline styles?', 'style', 'style', 1, '2024-03-02'),
(593, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'What does the CSS property \"float\" do?', NULL, 'It specifies the position of an element relative to its', 0, '2024-03-02'),
(592, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'Explain the concept of responsive web design.', 'dont knoow', 'Responsive web design is an approach to designing websi', 0, '2024-03-02'),
(591, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'What does CSS stand for?', 'Cascading Style Sheets', 'Cascading Style Sheets', 1, '2024-03-02'),
(590, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'What is the correct HTML for making a hyperlink?', '<a href=\"https://www.example.com\">Click here</a>', '<a href=\"https://www.example.com\">Click here</a>', 1, '2024-03-02'),
(589, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'What is the purpose of the CSS property \"position: relative;\"?', 'It positions an element absolutely within its container', 'It positions an element relative to its normal position', 0, '2024-03-02'),
(586, 5, 180, 'Test for webdevelopment in 20 days (2024-03-02 05:24:22 ypao)', 'image 2', 'err', 'description of image 2\r\n', 0, '2024-03-02'),
(587, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'What is the purpose of the alt attribute in an HTML image tag?', 'It provides alternative text for screen readers.', 'It provides alternative text for screen readers.', 1, '2024-03-02'),
(588, 5, 181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', 'Describe the concept of version control systems.', 'i dont know', 'Version control systems like Git enable developers to t', 0, '2024-03-02'),
(625, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'What is the purpose of the JavaScript \"this\" keyword?', 'It refers to the current object.', 'It refers to the current object.', 1, '2024-03-02'),
(626, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'What is the purpose of the CSS property \"z-index\"?', 'It specifies the z-coordinate of an element.', 'It specifies the stacking order of an element.', 0, '2024-03-02'),
(627, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'What is the difference between == and === operators in JavaScript?', '== performs type conversion, while === does not.', '== performs type conversion, while === performs strict comparison.', 0, '2024-03-02'),
(628, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'What does HTML stand for?', 'Hyper Text Markup Language', 'Hyper Text Markup Language', 1, '2024-03-02'),
(629, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'What is the latest version of HTML?', 'HTML5', 'HTML5', 1, '2024-03-02'),
(630, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'What is the purpose of the alt attribute in an HTML image tag?', 'It specifies the alignment of the image.', 'It provides alternative text for screen readers.', 0, '2024-03-02'),
(631, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'What is JavaScript and its role in web development?', '1', 'JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It enables features like form validation, DOM manipulation, and AJAX requests.', 0, '2024-03-02'),
(632, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'Which property is used to change the background color?', 'background-color', 'background-color', 1, '2024-03-02'),
(633, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'Which character is used to indicate an end tag in HTML?', '/', '/', 1, '2024-03-02'),
(634, 5, 185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', 'Explain the role of databases in web development.', '2', 'Databases store and manage data used by web applications. They allow for efficient data storage, retrieval, and manipulation, enabling dynamic content generation and user interactions.', 0, '2024-03-02'),
(635, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'Describe the purpose of server-side programming languages.', '1', 'Server-side programming languages like Python, Ruby, and PHP are used for building dynamic web applications. They handle requests from clients, interact with databases, and generate dynamic content for web pages.', 0, '2024-03-02'),
(636, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'Describe the concept of version control systems.', '2', 'Version control systems like Git enable developers to track changes to their code, collaborate with others, and manage different versions of their projects. They help in maintaining code integrity and facilitating team collaboration.', 0, '2024-03-02'),
(637, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'Which of the following is not a programming language?', 'HTML', 'HTML', 1, '2024-03-02'),
(638, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'Which character is used to indicate an end tag in HTML?', '/', '/', 1, '2024-03-02'),
(639, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'What is the purpose of the CSS property \"position: relative;\"?', 'It positions an element relative to its normal position.', 'It positions an element relative to its normal position.', 1, '2024-03-02'),
(640, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'Discuss the advantages and disadvantages of using a CSS preprocessor such as Sass or Less.', 'Advantages include improved code organization and maintainability, while disadvantages include a learning curve and increased compilation time.', 'Advantages include improved code organization and maintainability, while disadvantages include a learning curve and increased compilation time.', 1, '2024-03-02'),
(641, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'Discuss the concept of \"object-oriented programming\" (OOP) and its relevance in web development.', 'OOP is a programming technique used exclusively for back-end development.', 'OOP is a programming paradigm based on the concept of \"objects,\" which can contain data in the form of fields and code in the form of procedures.', 0, '2024-03-02'),
(642, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'Explain the concept of event bubbling and event capturing in JavaScript.', 'Event bubbling refers to the propagation of events from child to parent elements, while event capturing refers to the propagation from parent to child elements.', 'Event bubbling refers to the propagation of events from child to parent elements, while event capturing refers to the propagation from parent to child elements.', 1, '2024-03-02'),
(643, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'who is the person above ?', '1', 'he is just a normal happy person ', 0, '2024-03-02'),
(644, 5, 186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', 'Describe the differences between CSS Grid Layout and CSS Flexbox Layout.', 'CSS Grid Layout allows for more precise control over layout, while CSS Flexbox Layout is more flexible in handling content alignment.', 'CSS Grid Layout allows for more precise control over layout, while CSS Flexbox Layout is more flexible in handling content alignment.', 1, '2024-03-02'),
(645, 5, 187, 'Test for webdevelopment in 20 days (2024-03-02 07:32:03 vecd)', 'What does the CSS property \"float\" do?', 'It specifies the position of an element relative to its normal position.', 'It specifies the position of an element relative to its normal position.', 1, '2024-03-02'),
(646, 5, 187, 'Test for webdevelopment in 20 days (2024-03-02 07:32:03 vecd)', 'What is JavaScript and its role in web development?', '2', 'JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It enables features like form validation, DOM manipulation, and AJAX requests.', 0, '2024-03-02'),
(647, 5, 187, 'Test for webdevelopment in 20 days (2024-03-02 07:32:03 vecd)', 'Explain the difference between HTML and HTML5.', '3', 'HTML is a markup language used for creating the structure of web pages, while HTML5 is the latest version of HTML with additional features like semantic elements, video/audio support, and offline storage.', 0, '2024-03-02'),
(648, 5, 187, 'Test for webdevelopment in 20 days (2024-03-02 07:32:03 vecd)', 'Describe the purpose of server-side programming languages.', '4', 'Server-side programming languages like Python, Ruby, and PHP are used for building dynamic web applications. They handle requests from clients, interact with databases, and generate dynamic content for web pages.', 0, '2024-03-02'),
(649, 5, 187, 'Test for webdevelopment in 20 days (2024-03-02 07:32:03 vecd)', 'What is the purpose of the alt attribute in an HTML image tag?', 'It specifies the alignment of the image.', 'It provides alternative text for screen readers.', 0, '2024-03-02'),
(650, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'Describe the differences between CSS Grid Layout and CSS Flexbox Layout.', 'CSS Grid Layout is one-dimensional, while CSS Flexbox Layout is two-dimensional.', 'CSS Grid Layout allows for more precise control over layout, while CSS Flexbox Layout is more flexible in handling content alignment.', 0, '2024-03-02'),
(651, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'Describe the purpose and usage of the HTML \"data-\" attribute.', 'It is used to store custom data attributes for elements.', 'It is used to store custom data attributes for elements.', 1, '2024-03-02'),
(652, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'Discuss the concept of \"object-oriented programming\" (OOP) and its relevance in web development.', 'OOP is a programming paradigm based on the concept of \"objects,\" which can contain data in the form of fields and code in the form of procedures.', 'OOP is a programming paradigm based on the concept of \"objects,\" which can contain data in the form of fields and code in the form of procedures.', 1, '2024-03-02'),
(653, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'Explain the purpose and usage of the HTML \"meta\" tag with the \"viewport\" attribute.', 'The \"viewport\" attribute of the \"meta\" tag controls the layout and scaling of the viewport on mobile devices.', 'The \"viewport\" attribute of the \"meta\" tag controls the layout and scaling of the viewport on mobile devices.', 1, '2024-03-02'),
(654, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'Discuss the differences between GET and POST methods in HTTP requests.', 'GET method is used for sending small amounts of data, while POST method is used for sending large amounts of data.', 'GET method appends data to the URL, while POST method sends data in the request body.', 0, '2024-03-02'),
(655, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'who is the person above ?', '6\r\n', 'he is just a normal happy person ', 0, '2024-03-02'),
(656, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'What is the purpose of the HTML \"meta\" tag?', 'It specifies the character encoding for the document.', 'It specifies the character encoding for the document.', 1, '2024-03-02'),
(657, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'What does the HTML5 \"canvas\" element allow for?', 'It allows for creating structured documents.', 'It allows for drawing graphics and animations.', 0, '2024-03-02'),
(658, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'Describe the importance of security in web development.', '9', 'Security is essential in web development to protect sensitive data, prevent unauthorized access, and safeguard against cyber threats. It involves implementing measures like encryption, authentication, and secure coding practices.', 0, '2024-03-02'),
(659, 5, 188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', 'What does CSS stand for?', 'Colorful Style Sheets', 'Cascading Style Sheets', 0, '2024-03-02'),
(660, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'Explain the concept of CORS (Cross-Origin Resource Sharing) in web development.', 'It is a security feature that restricts resources from being requested from another domain.', 'It is a security feature that restricts resources from being requested from another domain.', 1, '2024-03-02'),
(661, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'Explain the concept of event bubbling and event capturing in JavaScript.', 'Event bubbling refers to the propagation of events from child to parent elements, while event capturing refers to the propagation from parent to child elements.', 'Event bubbling refers to the propagation of events from child to parent elements, while event capturing refers to the propagation from parent to child elements.', 1, '2024-03-02'),
(662, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'Discuss the concept of \"object-oriented programming\" (OOP) and its relevance in web development.', 'OOP is a programming technique used exclusively for back-end development.', 'OOP is a programming paradigm based on the concept of \"objects,\" which can contain data in the form of fields and code in the form of procedures.', 0, '2024-03-02'),
(663, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'Explain the purpose of the CSS \"box-sizing\" property and its possible values.', 'The \"box-sizing\" property sets the background color of an element.', 'The \"box-sizing\" property defines how the total width and height of an element is calculated.', 0, '2024-03-02'),
(664, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'What does the HTML5 \"canvas\" element allow for?', 'It allows for embedding multimedia content.', 'It allows for drawing graphics and animations.', 0, '2024-03-02'),
(665, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'Which character is used to indicate an end tag in HTML?', '?', '/', 0, '2024-03-02'),
(666, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'What does CSS stand for?', 'Computer Style Sheets', 'Cascading Style Sheets', 0, '2024-03-02'),
(667, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'Which property is used to change the background color?', 'background', 'background-color', 0, '2024-03-02'),
(668, 5, 189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', 'what is web development?', '9', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-02'),
(669, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'Explain the role of databases in web development.', '1', 'Databases store and manage data used by web applications. They allow for efficient data storage, retrieval, and manipulation, enabling dynamic content generation and user interactions.', 0, '2024-03-02'),
(670, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'What is the purpose of the alt attribute in an HTML image tag?', 'It provides alternative text for search engines.', 'It provides alternative text for screen readers.', 0, '2024-03-02'),
(671, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'Which property is used to change the background color?', 'color', 'background-color', 0, '2024-03-02'),
(672, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'What is the correct HTML for making a hyperlink?', '<href=\"https://www.example.com\">Click here</href>', '<a href=\"https://www.example.com\">Click here</a>', 0, '2024-03-02'),
(673, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'What does HTML stand for?', 'Home Tool Markup Language', 'Hyper Text Markup Language', 0, '2024-03-02'),
(674, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'Which of the following is not a programming language?', 'Python', 'HTML', 0, '2024-03-02'),
(675, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'Which character is used to indicate an end tag in HTML?', '!', '/', 0, '2024-03-02'),
(676, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'What is the correct HTML element for inserting a line break?', '<lb>', '<br>', 0, '2024-03-02'),
(677, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'Which HTML attribute is used to define inline styles?', 'font', 'style', 0, '2024-03-02'),
(678, 5, 190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', 'What does CSS stand for?', 'Computer Style Sheets', 'Cascading Style Sheets', 0, '2024-03-02'),
(679, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'Explain the concept of responsive web design.', '1', 'Responsive web design is an approach to designing websites that ensures optimal viewing and interaction across various devices and screen sizes. It involves using flexible layouts, images, and CSS media queries.', 0, '2024-03-02'),
(680, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'What does the CSS property \"float\" do?', 'It specifies the alignment of an element.', 'It specifies the position of an element relative to its normal position.', 0, '2024-03-02'),
(681, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'What is the correct HTML for inserting an image?', '<img alt=\"MyImage\">image.jpg</img>', '<img src=\"image.jpg\" alt=\"MyImage\">', 0, '2024-03-02'),
(682, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'What is the correct HTML element for inserting a line break?', '<line>', '<br>', 0, '2024-03-02'),
(683, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'what is web development?', '5', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-02'),
(684, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'What is the correct HTML for making a hyperlink?', '<a href=\"https://www.example.com\">Click here</a>', '<a href=\"https://www.example.com\">Click here</a>', 1, '2024-03-02'),
(685, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'Which HTML attribute is used to define inline styles?', 'style', 'style', 1, '2024-03-02'),
(686, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'What is the purpose of the JavaScript \"setTimeout\" function?', 'It executes a function after a specified delay.', 'It executes a function after a specified delay.', 1, '2024-03-02'),
(687, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'Explain the concept of \"callback hell\" in JavaScript and how it can be mitigated.', 'Callback hell is a term used to describe the performance degradation caused by excessive use of callback functions.', 'Callback hell refers to the nesting of multiple callback functions, leading to code that is difficult to read and maintain.', 0, '2024-03-02'),
(688, 5, 191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', 'Discuss the advantages and disadvantages of using a CSS preprocessor such as Sass or Less.', 'Advantages include easier debugging and better documentation, while disadvantages include lack of community support.', 'Advantages include improved code organization and maintainability, while disadvantages include a learning curve and increased compilation time.', 0, '2024-03-02'),
(689, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'this is image question 2', '1', 'answer', 0, '2024-03-02'),
(690, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'Explain the role of frameworks in web development.', '2', 'Frameworks provide a structured environment and reusable components for building web applications more efficiently. They offer predefined libraries, tools, and conventions to streamline development tasks.', 0, '2024-03-02'),
(691, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'Which HTML attribute is used to define inline styles?', 'font', 'style', 0, '2024-03-02'),
(692, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'What is the correct HTML element for inserting a line break?', '<line>', '<br>', 0, '2024-03-02'),
(693, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'what is web development?', '5', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-02'),
(694, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'What is the correct HTML for making a hyperlink?', '<a href=\"https://www.example.com\">Click here</a>', '<a href=\"https://www.example.com\">Click here</a>', 1, '2024-03-02'),
(695, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'Which character is used to indicate an end tag in HTML?', '.', '/', 0, '2024-03-02'),
(696, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'What is the latest version of HTML?', 'HTML5', 'HTML5', 1, '2024-03-02'),
(697, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'What does HTML stand for?', 'Home Tool Markup Language', 'Hyper Text Markup Language', 0, '2024-03-02'),
(698, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'Which of the following is not a programming language?', 'HTML', 'HTML', 1, '2024-03-02'),
(699, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'What is the correct HTML for inserting an image?', '<img src=\"image.jpg\" alt=\"MyImage\">', '<img src=\"image.jpg\" alt=\"MyImage\">', 1, '2024-03-02'),
(700, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'What does the HTML5 \"canvas\" element allow for?', 'It allows for drawing graphics and animations.', 'It allows for drawing graphics and animations.', 1, '2024-03-02'),
(701, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'Explain the concept of CORS (Cross-Origin Resource Sharing) in web development.', 'It is a security feature that restricts resources from being requested from another domain.', 'It is a security feature that restricts resources from being requested from another domain.', 1, '2024-03-02'),
(702, 5, 192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', 'Explain the concept of CORS (Cross-Origin Resource Sharing) in web development.', 'It is a security feature that restricts resources from being requested from another domain.', 'It is a security feature that restricts resources from being requested from another domain.', 1, '2024-03-02'),
(703, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'Which character is used to indicate an end tag in HTML?', '/', '/', 1, '2024-03-02'),
(704, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'What is the correct HTML element for inserting a line break?', '<lb>', '<br>', 0, '2024-03-02'),
(705, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'What is the correct HTML for making a hyperlink?', '<a>https://www.example.com</a>', '<a href=\"https://www.example.com\">Click here</a>', 0, '2024-03-02'),
(706, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'Which HTML attribute is used to define inline styles?', 'color', 'style', 0, '2024-03-02'),
(707, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'What is the latest version of HTML?', 'HTML5', 'HTML5', 1, '2024-03-02'),
(708, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'What is the correct HTML for inserting an image?', '<img alt=\"MyImage\">image.jpg</img>', '<img src=\"image.jpg\" alt=\"MyImage\">', 0, '2024-03-02'),
(709, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'What does CSS stand for?', 'Creative Style Sheets', 'Cascading Style Sheets', 0, '2024-03-02'),
(710, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'Which of the following is not a programming language?', 'HTML', 'HTML', 1, '2024-03-02'),
(711, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'What does HTML stand for?', 'Hyper Text Markup Language', 'Hyper Text Markup Language', 1, '2024-03-02'),
(712, 5, 193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', 'Describe the purpose of CSS.', '10', 'CSS (Cascading Style Sheets) is used for styling the presentation of web pages. It defines how HTML elements should be displayed, including layout, colors, fonts, and more.', 0, '2024-03-02'),
(713, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'Explain the role of databases in web development.', '1', 'Databases store and manage data used by web applications. They allow for efficient data storage, retrieval, and manipulation, enabling dynamic content generation and user interactions.', 0, '2024-03-02'),
(714, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'What is the purpose of the CSS property \"z-index\"?', 'It specifies the stacking order of an element.', 'It specifies the stacking order of an element.', 1, '2024-03-02'),
(715, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'What is the purpose of the HTML \"meta\" tag?', 'It specifies the author of the document.', 'It specifies the character encoding for the document.', 0, '2024-03-02'),
(716, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'What is the purpose of a web server?', '4', 'A web server is software that delivers web content to clients over the internet. It processes incoming requests, retrieves and serves web pages, and manages communication between clients and servers.', 0, '2024-03-02'),
(717, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'Which of the following is not a programming language?', 'HTML', 'HTML', 1, '2024-03-02'),
(718, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'What does CSS stand for?', 'Cascading Style Sheets', 'Cascading Style Sheets', 1, '2024-03-02'),
(719, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'What is JavaScript and its role in web development?', '7', 'JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It enables features like form validation, DOM manipulation, and AJAX requests.', 0, '2024-03-02'),
(720, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'Explain the concept of responsive web design.', '8', 'Responsive web design is an approach to designing websites that ensures optimal viewing and interaction across various devices and screen sizes. It involves using flexible layouts, images, and CSS media queries.', 0, '2024-03-02'),
(721, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'What is the correct HTML element for inserting a line break?', '<line>', '<br>', 0, '2024-03-02'),
(722, 5, 194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', 'what is web development?', '10', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-02'),
(723, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'What is JavaScript and its role in web development?', '1', 'JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It enables features like form validation, DOM manipulation, and AJAX requests.', 0, '2024-03-02'),
(724, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'What is the purpose of the alt attribute in an HTML image tag?', 'It provides alternative text for search engines.', 'It provides alternative text for screen readers.', 0, '2024-03-02'),
(725, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'Which property is used to change the background color?', 'color', 'background-color', 0, '2024-03-02'),
(726, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'What is the correct HTML for inserting an image?', '<image src=\"image.jpg\" alt=\"MyImage\">', '<img src=\"image.jpg\" alt=\"MyImage\">', 0, '2024-03-02'),
(727, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'Which character is used to indicate an end tag in HTML?', '!', '/', 0, '2024-03-02'),
(728, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'Which of the following is not a programming language?', 'Python', 'HTML', 0, '2024-03-02'),
(729, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'what is web development?', '7', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-02'),
(730, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'What does CSS stand for?', 'Colorful Style Sheets', 'Cascading Style Sheets', 0, '2024-03-02'),
(731, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'What is the correct HTML for making a hyperlink?', '<link>https://www.example.com</link>', '<a href=\"https://www.example.com\">Click here</a>', 0, '2024-03-02'),
(732, 5, 195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', 'What does HTML stand for?', 'Hyperlinks and Text Markup Language', 'Hyper Text Markup Language', 0, '2024-03-02'),
(733, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'What is the purpose of the CSS property \"position: relative;\"?', 'It positions an element relative to its normal position.', 'It positions an element relative to its normal position.', 1, '2024-03-02'),
(734, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'Explain the concept of responsive web design.', '2', 'Responsive web design is an approach to designing websites that ensures optimal viewing and interaction across various devices and screen sizes. It involves using flexible layouts, images, and CSS media queries.', 0, '2024-03-02'),
(735, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'What does the CSS property \"float\" do?', 'It specifies the alignment of an element.', 'It specifies the position of an element relative to its normal position.', 0, '2024-03-02'),
(736, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'What is the correct HTML for making a hyperlink?', '<link>https://www.example.com</link>', '<a href=\"https://www.example.com\">Click here</a>', 0, '2024-03-02'),
(737, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'Which of the following is not a programming language?', 'Python', 'HTML', 0, '2024-03-02'),
(738, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'What is the correct HTML for inserting an image?', '<image src=\"image.jpg\" alt=\"MyImage\">', '<img src=\"image.jpg\" alt=\"MyImage\">', 0, '2024-03-02'),
(739, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'Which HTML attribute is used to define inline styles?', 'class', 'style', 0, '2024-03-02'),
(740, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'What is the correct HTML element for inserting a line break?', '<lb>', '<br>', 0, '2024-03-02'),
(741, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'Which property is used to change the background color?', 'bgcolor', 'background-color', 0, '2024-03-02'),
(742, 5, 196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', 'Which character is used to indicate an end tag in HTML?', '!', '/', 0, '2024-03-02'),
(743, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'What is the purpose of a web server?', '1', 'A web server is software that delivers web content to clients over the internet. It processes incoming requests, retrieves and serves web pages, and manages communication between clients and servers.', 0, '2024-03-02'),
(744, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'Describe the purpose of server-side programming languages.', '2', 'Server-side programming languages like Python, Ruby, and PHP are used for building dynamic web applications. They handle requests from clients, interact with databases, and generate dynamic content for web pages.', 0, '2024-03-02'),
(745, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'What does CSS stand for?', 'Cascading Style Sheets', 'Cascading Style Sheets', 1, '2024-03-02'),
(746, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'Which property is used to change the background color?', 'color', 'background-color', 0, '2024-03-02'),
(747, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'What is the correct HTML for making a hyperlink?', '<a>https://www.example.com</a>', '<a href=\"https://www.example.com\">Click here</a>', 0, '2024-03-02'),
(748, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'What is the latest version of HTML?', 'XHTML', 'HTML5', 0, '2024-03-02'),
(749, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'What is the correct HTML element for inserting a line break?', '<line>', '<br>', 0, '2024-03-02'),
(750, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'What does HTML stand for?', 'Hyper Text Makeup Language', 'Hyper Text Markup Language', 0, '2024-03-02'),
(751, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'what is web development?', '7', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-02'),
(752, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'Which of the following is not a programming language?', 'Python', 'HTML', 0, '2024-03-02'),
(753, 5, 197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', 'Which character is used to indicate an end tag in HTML?', '?', '/', 0, '2024-03-02'),
(754, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'this is image question 2', 'ghrtn', 'answer', 0, '2024-03-02'),
(755, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'What is JavaScript and its role in web development?', '', 'JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It enables features like form validation, DOM manipulation, and AJAX requests.', 0, '2024-03-02'),
(756, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'Which character is used to indicate an end tag in HTML?', '/', '/', 1, '2024-03-02'),
(757, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'what is web development?', 'ferxgf', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-02'),
(758, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'What is the correct HTML for making a hyperlink?', '<a href=\"https://www.example.com\">Click here</a>', '<a href=\"https://www.example.com\">Click here</a>', 1, '2024-03-02'),
(759, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'What is the correct HTML for inserting an image?', '<img alt=\"MyImage\">image.jpg</img>', '<img src=\"image.jpg\" alt=\"MyImage\">', 0, '2024-03-02'),
(760, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'Which property is used to change the background color?', 'background', 'background-color', 0, '2024-03-02'),
(761, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'What is the correct HTML element for inserting a line break?', '<br>', '<br>', 1, '2024-03-02'),
(762, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'What is the latest version of HTML?', 'HTML5', 'HTML5', 1, '2024-03-02'),
(763, 5, 200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', 'What is the difference between == and === operators in JavaScript?', '== performs type conversion, while === performs strict comparison.', '== performs type conversion, while === performs strict comparison.', 1, '2024-03-02'),
(764, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'what is web development?', 'web development is used to understand the concet !\r\n', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-04'),
(765, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'Which property is used to change the background color?', 'background-color', 'background-color', 1, '2024-03-04'),
(766, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'What does HTML stand for?', 'Hyperlinks and Text Markup Language', 'Hyper Text Markup Language', 0, '2024-03-04'),
(767, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'Which of the following is not a programming language?', 'Python', 'HTML', 0, '2024-03-04'),
(768, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'Which HTML attribute is used to define inline styles?', 'color', 'style', 0, '2024-03-04'),
(769, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'What is the correct HTML element for inserting a line break?', '<br>', '<br>', 1, '2024-03-04'),
(770, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'What does CSS stand for?', 'Creative Style Sheets', 'Cascading Style Sheets', 0, '2024-03-04'),
(771, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'What is the correct HTML for inserting an image?', '<image src=\"image.jpg\" alt=\"MyImage\">', '<img src=\"image.jpg\" alt=\"MyImage\">', 0, '2024-03-04'),
(772, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'What is the latest version of HTML?', 'XHTML', 'HTML5', 0, '2024-03-04'),
(773, 5, 201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', 'Which character is used to indicate an end tag in HTML?', '!', '/', 0, '2024-03-04'),
(774, 5, 202, 'Test for webdevelopment in 20 days (2024-03-04 15:03:31 oxuf)', 'What is JavaScript and its role in web development?', '', 'JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It enables features like form validation, DOM manipulation, and AJAX requests.', 0, '2024-03-04'),
(775, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Describe Image ?', 'rows of vacant seats await their audience, the flickering screen the sole source of illumination in the dimly lit hall', '\r\nIn the silent expanse of the empty movie theatre, rows of vacant seats await their audience, the flickering screen the sole source of illumination in the dimly lit hall, a poignant reminder of the absence of laughter and applause.', 1, '2024-03-04'),
(776, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'What is the purpose of the HTML \"meta\" tag?', 'It specifies the character encoding for the document.', 'It specifies the character encoding for the document.', 1, '2024-03-04'),
(777, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Discuss the concept of \"object-oriented programming\" (OOP) and its relevance in web development.', 'OOP is a programming paradigm based on the concept of \"objects,\" which can contain data in the form of fields and code in the form of procedures.', 'OOP is a programming paradigm based on the concept of \"objects,\" which can contain data in the form of fields and code in the form of procedures.', 1, '2024-03-04'),
(778, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Discuss the differences between GET and POST methods in HTTP requests.', 'GET method is used for sending small amounts of data, while POST method is used for sending large amounts of data.', 'GET method appends data to the URL, while POST method sends data in the request body.', 0, '2024-03-04');
INSERT INTO `student_result_details` (`result_id`, `user_id`, `test_id`, `test_name`, `question`, `useranswer`, `correctanswer`, `marks`, `result_date`) VALUES
(779, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Explain the purpose of the CSS \"box-sizing\" property and its possible values.', 'The \"box-sizing\" property defines how the total width and height of an element is calculated.', 'The \"box-sizing\" property defines how the total width and height of an element is calculated.', 1, '2024-03-04'),
(780, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Explain the purpose and usage of the HTML \"meta\" tag with the \"viewport\" attribute.', 'The \"viewport\" attribute of the \"meta\" tag controls the layout and scaling of the viewport on mobile devices.', 'The \"viewport\" attribute of the \"meta\" tag controls the layout and scaling of the viewport on mobile devices.', 1, '2024-03-04'),
(781, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Describe the differences between CSS Grid Layout and CSS Flexbox Layout.', 'CSS Grid Layout is one-dimensional, while CSS Flexbox Layout is two-dimensional.', 'CSS Grid Layout allows for more precise control over layout, while CSS Flexbox Layout is more flexible in handling content alignment.', 0, '2024-03-04'),
(782, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Explain the concept of CORS (Cross-Origin Resource Sharing) in web development.', 'It is a security feature that restricts resources from being requested from another domain.', 'It is a security feature that restricts resources from being requested from another domain.', 1, '2024-03-04'),
(783, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Explain the concept of event bubbling and event capturing in JavaScript.', 'Event bubbling refers to the propagation of events from child to parent elements, while event capturing refers to the propagation from parent to child elements.', 'Event bubbling refers to the propagation of events from child to parent elements, while event capturing refers to the propagation from parent to child elements.', 1, '2024-03-04'),
(784, 5, 203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', 'Describe the purpose and usage of the HTML \"data-\" attribute.', 'It is used to store custom data attributes for elements.', 'It is used to store custom data attributes for elements.', 1, '2024-03-04'),
(785, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'Which character is used to indicate an end tag in HTML?', '/', '/', 1, '2024-03-04'),
(786, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'What is the correct HTML element for inserting a line break?', '<br>', '<br>', 1, '2024-03-04'),
(787, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'Describe the importance of security in web development.', 'cgeht', 'Security is essential in web development to protect sensitive data, prevent unauthorized access, and safeguard against cyber threats. It involves implementing measures like encryption, authentication, and secure coding practices.', 0, '2024-03-04'),
(788, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'What is JavaScript and its role in web development?', 'crthe', 'JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It enables features like form validation, DOM manipulation, and AJAX requests.', 0, '2024-03-04'),
(789, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'what is web development?', 'cehtrehr', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-04'),
(790, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'Which HTML attribute is used to define inline styles?', 'style', 'style', 1, '2024-03-04'),
(791, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'Which of the following is not a programming language?', 'HTML', 'HTML', 1, '2024-03-04'),
(792, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'What is the purpose of the HTML \"meta\" tag?', 'It specifies the character encoding for the document.', 'It specifies the character encoding for the document.', 1, '2024-03-04'),
(793, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'Explain the concept of Cross-Origin Resource Sharing (CORS) and its role in web development security.', 'htrct4rg', 'Cross-Origin Resource Sharing (CORS) is a security feature implemented in web browsers to prevent unauthorized access to resources across different origins (domains). It defines a set of HTTP headers that allow servers to specify which origins are permitted to access their resources. CORS plays a crucial role in web development security by mitigating the risks associated with cross-origin requests, such as cross-site scripting (XSS) and cross-site request forgery (CSRF), and protecting sensitive data from unauthorized access.', 0, '2024-03-04'),
(794, 5, 204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', 'Discuss the concept of serverless architecture and its benefits in modern web development.', 'sdtgw4c', 'Serverless architecture, also known as Function-as-a-Service (FaaS), is a cloud computing model where applications are built and deployed without the need to manage servers or infrastructure. In serverless architecture, developers write modular functions that are triggered by events and executed in stateless containers managed by a cloud provider. Serverless computing offers benefits such as scalability, cost-effectiveness, and simplified deployment, allowing developers to focus on writing code and delivering value to users without worrying about server management.', 0, '2024-03-04'),
(795, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'Describe the importance of security in web development.', '', 'Security is essential in web development to protect sensitive data, prevent unauthorized access, and safeguard against cyber threats. It involves implementing measures like encryption, authentication, and secure coding practices.', 0, '2024-03-04'),
(796, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'Describe the importance of security in web development.', '', 'Security is essential in web development to protect sensitive data, prevent unauthorized access, and safeguard against cyber threats. It involves implementing measures like encryption, authentication, and secure coding practices.', 0, '2024-03-04'),
(797, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'What is the correct HTML for making a hyperlink?', '<a href=\"https://www.example.com\">Click here</a>', '<a href=\"https://www.example.com\">Click here</a>', 1, '2024-03-04'),
(798, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'What is the correct HTML for making a hyperlink?', '<a href=\"https://www.example.com\">Click here</a>', '<a href=\"https://www.example.com\">Click here</a>', 1, '2024-03-04'),
(799, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'describe image ?', '', 'With boundless energy and unwavering focus, the playful dog darted across the grassy field, joyously retrieving the tennis ball thrown by its owner.', 0, '2024-03-04'),
(800, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'describe image ?', '', 'With boundless energy and unwavering focus, the playful dog darted across the grassy field, joyously retrieving the tennis ball thrown by its owner.', 0, '2024-03-04'),
(801, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'What is the correct HTML element for inserting a line break?', NULL, '<br>', 0, '2024-03-04'),
(802, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'What is the correct HTML element for inserting a line break?', NULL, '<br>', 0, '2024-03-04'),
(803, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'What is the correct HTML element for inserting a line break?', NULL, '<br>', 0, '2024-03-04'),
(804, 5, 206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', 'What is the correct HTML element for inserting a line break?', NULL, '<br>', 0, '2024-03-04'),
(805, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'Discuss the concept of Progressive Web Apps (PWAs) and their impact on modern web development.', '123123', 'Progressive Web Apps (PWAs) are web applications that leverage modern web technologies to provide a native app-like experience to users across various devices and platforms. PWAs offer features such as offline functionality, push notifications, and installation prompts, blurring the line between web and native mobile applications. Their impact on modern web development includes enhanced user engagement, increased conversions, and broader reach, especially in markets with limited internet connectivity.', 0, '2024-03-04'),
(806, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'explain what you see ?', 'reycyeherh', 'it is image of chat bot ,  which is looking like a robot !', 0, '2024-03-04'),
(807, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'What is the purpose of the CSS property \"z-index\"?', 'It specifies the z-coordinate of an element.', 'It specifies the stacking order of an element.', 0, '2024-03-04'),
(808, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'What does CSS stand for?', 'Creative Style Sheets', 'Cascading Style Sheets', 0, '2024-03-04'),
(809, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'Which of the following is not a programming language?', 'Java', 'HTML', 0, '2024-03-04'),
(810, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'describe the image ? ', '', 'The fisherman stood firm on the rocky shoreline, the rhythmic sound of crashing waves providing a soothing backdrop as he patiently waited for a tug on his line.', 0, '2024-03-04'),
(811, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'describe the image ? ', '', 'The fisherman stood firm on the rocky shoreline, the rhythmic sound of crashing waves providing a soothing backdrop as he patiently waited for a tug on his line.', 0, '2024-03-04'),
(812, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'describe the image ? ', '', 'The fisherman stood firm on the rocky shoreline, the rhythmic sound of crashing waves providing a soothing backdrop as he patiently waited for a tug on his line.', 0, '2024-03-04'),
(813, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'what is web development?', '', 'Web development types have been classified into front-end development, back-end development, and full-stack development. For an excellently interactive website or web app for your business, you need to have expert developers who are specialists in their calling.', 0, '2024-03-04'),
(814, 5, 207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', 'What does HTML stand for?', NULL, 'Hyper Text Markup Language', 0, '2024-03-04'),
(815, 5, 210, 'Test for webdevelopment in 20 days (2024-03-04 15:47:10 oznt)', 'What is the purpose of the JavaScript \"setTimeout\" function?', NULL, 'It executes a function after a specified delay.', 0, '2024-03-04'),
(816, 5, 210, 'Test for webdevelopment in 20 days (2024-03-04 15:47:10 oznt)', 'What is the purpose of the JavaScript \"setTimeout\" function?', NULL, 'It executes a function after a specified delay.', 0, '2024-03-04'),
(817, 5, 210, 'Test for webdevelopment in 20 days (2024-03-04 15:47:10 oznt)', 'What is the purpose of the JavaScript \"setTimeout\" function?', NULL, 'It executes a function after a specified delay.', 0, '2024-03-04'),
(818, 5, 210, 'Test for webdevelopment in 20 days (2024-03-04 15:47:10 oznt)', 'What is the purpose of the JavaScript \"setTimeout\" function?', NULL, 'It executes a function after a specified delay.', 0, '2024-03-04'),
(819, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'What are the advantages of using frameworks like Bootstrap for web development?', '', 'Frameworks like Bootstrap provide pre-designed and customizable components, responsive grid systems, and built-in CSS and JavaScript functionalities, which help in creating consistent and mobile-friendly web applications with less code.', 0, '2024-03-04'),
(820, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'Discuss the concept of serverless architecture and its benefits in modern web development.', 'retert', 'Serverless architecture, also known as Function-as-a-Service (FaaS), is a cloud computing model where applications are built and deployed without the need to manage servers or infrastructure. In serverless architecture, developers write modular functions that are triggered by events and executed in stateless containers managed by a cloud provider. Serverless computing offers benefits such as scalability, cost-effectiveness, and simplified deployment, allowing developers to focus on writing code and delivering value to users without worrying about server management.', 0, '2024-03-04'),
(821, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'What does the CSS property \"float\" do?', 'It specifies the position of an element relative to its normal position.', 'It specifies the position of an element relative to its normal position.', 1, '2024-03-04'),
(822, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'What does the HTML5 \"canvas\" element allow for?', 'It allows for drawing graphics and animations.', 'It allows for drawing graphics and animations.', 1, '2024-03-04'),
(823, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'Explain the purpose of the CSS \"box-sizing\" property and its possible values.', 'The \"box-sizing\" property determines the spacing between elements.', 'The \"box-sizing\" property defines how the total width and height of an element is calculated.', 0, '2024-03-04'),
(824, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'who is the person above ?', 'etcwt', 'he is just a normal happy person ', 0, '2024-03-04'),
(825, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'describe image ?', 'evqt3t', 'With boundless energy and unwavering focus, the playful dog darted across the grassy field, joyously retrieving the tennis ball thrown by its owner.', 0, '2024-03-04'),
(826, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'What is the latest version of HTML?', 'HTML5', 'HTML5', 1, '2024-03-04'),
(827, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'What is the correct HTML for making a hyperlink?', NULL, '<a href=\"https://www.example.com\">Click here</a>', 0, '2024-03-04'),
(828, 5, 211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', 'Which character is used to indicate an end tag in HTML?', '/', '/', 1, '2024-03-04'),
(829, 5, 212, 'Test for webdevelopment in 20 days (2024-03-04 15:52:20 bjxx)', 'Describe image ?', '', 'In the golden glow of the setting sun, the lone cricketer practiced his shots on the grassy pitch, each powerful stroke sending the ball soaring through the air, a testament to his dedication and love for the game.', 0, '2024-03-04'),
(830, 5, 212, 'Test for webdevelopment in 20 days (2024-03-04 15:52:20 bjxx)', 'What are the principles of Object-Oriented Programming (OOP) and how are they applied in web development?', 'ertyy\r\n', 'The principles of Object-Oriented Programming (OOP) include encapsulation, inheritance, and polymorphism. In web development, these principles are applied through the use of classes, objects, and methods. Encapsulation ensures data security by bundling data and methods together, inheritance enables code reuse and promotes modularity, and polymorphism allows objects to take on multiple forms and behaviors.', 0, '2024-03-04'),
(831, 5, 212, 'Test for webdevelopment in 20 days (2024-03-04 15:52:20 bjxx)', 'What is the purpose of the alt attribute in an HTML image tag?', 'It specifies the alignment of the image.', 'It provides alternative text for screen readers.', 0, '2024-03-04'),
(832, 5, 212, 'Test for webdevelopment in 20 days (2024-03-04 15:52:20 bjxx)', 'What does HTML stand for?', NULL, 'Hyper Text Markup Language', 0, '2024-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `user_tests_details`
--

DROP TABLE IF EXISTS `user_tests_details`;
CREATE TABLE IF NOT EXISTS `user_tests_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `test_name` varchar(155) NOT NULL,
  `test_date` date NOT NULL,
  `test_marks` int NOT NULL,
  `test_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_name` (`test_name`),
  KEY `User_tests_details_test_user_id_89c17f0d` (`test_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_tests_details`
--

INSERT INTO `user_tests_details` (`id`, `test_name`, `test_date`, `test_marks`, `test_user_id`) VALUES
(209, 'Test for webdevelopment in 20 days (2024-03-04 15:44:07 onlf)', '2024-03-04', 0, 5),
(207, 'Test for webdevelopment in 20 days (2024-03-04 15:37:41 esmy)', '2024-03-04', 0, 5),
(208, 'Test for webdevelopment in 20 days (2024-03-04 15:43:30 jttk)', '2024-03-04', 0, 5),
(206, 'Test for webdevelopment in 20 days (2024-03-04 15:31:21 ctpn)', '2024-03-04', 2, 5),
(204, 'Test for webdevelopment in 20 days (2024-03-04 15:20:32 pcjh)', '2024-03-04', 5, 5),
(205, 'Test for webdevelopment in 20 days (2024-03-04 15:30:39 wevq)', '2024-03-04', 0, 5),
(203, 'Test for webdevelopment in 20 days (2024-03-04 15:16:46 dhqu)', '2024-03-04', 8, 5),
(202, 'Test for webdevelopment in 20 days (2024-03-04 15:03:31 oxuf)', '2024-03-04', 0, 5),
(201, 'Test for webdevelopment in 20 days (2024-03-04 15:00:54 vxzu)', '2024-03-04', 2, 5),
(200, 'Test for webdevelopment in 20 days (2024-03-02 10:52:04 bktg)', '2024-03-02', 5, 5),
(199, 'Test for webdevelopment in 20 days (2024-03-02 08:04:50 ysjs)', '2024-03-02', 0, 5),
(198, 'Test for webdevelopment in 20 days (2024-03-02 08:02:50 kgty)', '2024-03-02', 0, 5),
(197, 'Test for webdevelopment in 20 days (2024-03-02 07:58:04 pvhk)', '2024-03-02', 1, 5),
(196, 'Test for webdevelopment in 20 days (2024-03-02 07:56:27 vrij)', '2024-03-02', 1, 5),
(195, 'Test for webdevelopment in 20 days (2024-03-02 07:53:45 wigi)', '2024-03-02', 0, 5),
(194, 'Test for webdevelopment in 20 days (2024-03-02 07:51:55 jjnx)', '2024-03-02', 3, 5),
(193, 'Test for webdevelopment in 20 days (2024-03-02 07:48:38 enqx)', '2024-03-02', 4, 5),
(192, 'Test for webdevelopment in 20 days (2024-03-02 07:46:45 jifb)', '2024-03-02', 7, 5),
(191, 'Test for webdevelopment in 20 days (2024-03-02 07:43:44 qfts)', '2024-03-02', 3, 5),
(190, 'Test for webdevelopment in 20 days (2024-03-02 07:42:25 yeex)', '2024-03-02', 0, 5),
(189, 'Test for webdevelopment in 20 days (2024-03-02 07:36:22 lcmk)', '2024-03-02', 2, 5),
(188, 'Test for webdevelopment in 20 days (2024-03-02 07:33:09 qadn)', '2024-03-02', 4, 5),
(187, 'Test for webdevelopment in 20 days (2024-03-02 07:32:03 vecd)', '2024-03-02', 1, 5),
(186, 'Test for webdevelopment in 20 days (2024-03-02 07:27:45 rkli)', '2024-03-02', 6, 5),
(185, 'Test for webdevelopment in 20 days (2024-03-02 07:24:45 jizd)', '2024-03-02', 5, 5),
(184, 'Test for webdevelopment in 20 days (2024-03-02 07:02:53 vtvb)', '2024-03-02', 5, 5),
(183, 'Test for webdevelopment in 20 days (2024-03-02 06:06:49 vild)', '2024-03-02', 8, 5),
(182, 'Test for webdevelopment in 20 days (2024-03-02 05:47:49 afpu)', '2024-03-02', 5, 5),
(181, 'Test for webdevelopment in 20 days (2024-03-02 05:41:54 ohjr)', '2024-03-02', 5, 5),
(180, 'Test for webdevelopment in 20 days (2024-03-02 05:24:22 ypao)', '2024-03-02', 0, 5),
(179, 'Test for webdevelopment in 20 days (2024-03-02 05:24:04 vdnv)', '2024-03-02', 0, 5),
(210, 'Test for webdevelopment in 20 days (2024-03-04 15:47:10 oznt)', '2024-03-04', 0, 5),
(211, 'Test for webdevelopment in 20 days (2024-03-04 15:49:12 jusm)', '2024-03-04', 4, 5),
(212, 'Test for webdevelopment in 20 days (2024-03-04 15:52:20 bjxx)', '2024-03-04', 0, 5),
(213, 'Test for webdevelopment in 20 days (2024-03-04 15:56:28 gnlw)', '2024-03-04', 0, 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
