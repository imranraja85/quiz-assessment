CREATE TABLE `chapters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `chapter_number` int(11) NOT NULL COMMENT 'Chapter number',
  `language_course_id` int(11) unsigned DEFAULT NULL COMMENT 'Foreign key to language course table',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Datetime of latest update',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
  PRIMARY KEY (`id`),
  KEY `c_language_course_id` (`language_course_id`),
  CONSTRAINT `FK_c_language_course_id` FOREIGN KEY (`language_course_id`) REFERENCES `language_courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

CREATE TABLE `language_courses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(80) NOT NULL DEFAULT '' COMMENT 'Name of the language',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Datetime of latest update',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `lessons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_number` int(11) NOT NULL COMMENT 'Lesson number',
  `chapter_id` int(11) unsigned DEFAULT NULL COMMENT 'Foreign key to chapters table',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Datetime of latest update',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
  PRIMARY KEY (`id`),
  KEY `l_chapter_id` (`chapter_id`),
  CONSTRAINT `FK_l_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

CREATE TABLE `quiz_questions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) unsigned DEFAULT NULL COMMENT 'Foreign key to lessions table',
  `question` varchar(255) NOT NULL COMMENT 'Assessment question',
  `answer` varchar(255) NOT NULL COMMENT 'Answer for the assessment question',
  `question_type` enum('multiple_choice','short_answer') NOT NULL COMMENT 'Type of question',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Datetime of latest update',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
  PRIMARY KEY (`id`),
  KEY `qq_lesson_id` (`lesson_id`),
  CONSTRAINT `FK_qq_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20110614022601');

INSERT INTO schema_migrations (version) VALUES ('20110614022619');

INSERT INTO schema_migrations (version) VALUES ('20110614022634');

INSERT INTO schema_migrations (version) VALUES ('20110614022647');