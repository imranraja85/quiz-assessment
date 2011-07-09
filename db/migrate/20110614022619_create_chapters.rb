class CreateChapters < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `chapters` (
                    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                    `chapter_number` INT(11) NOT NULL COMMENT 'Chapter number',
                    `language_course_id` INT(11) UNSIGNED COMMENT 'Foreign key to language course table',
                    `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                    PRIMARY KEY  (`id`),
                    KEY `c_language_course_id` (`language_course_id`),
                    CONSTRAINT `FK_c_language_course_id` FOREIGN KEY (`language_course_id`) REFERENCES `language_courses`(`id`)
                  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :chapters
  end
end
