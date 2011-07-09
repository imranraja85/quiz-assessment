class CreateLessons < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `lessons` (
                    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                    `lesson_number` INT(11) NOT NULL COMMENT 'Lesson number',
                    `chapter_id` INT(11) UNSIGNED COMMENT 'Foreign key to chapters table',
                    `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                    PRIMARY KEY  (`id`),
                    KEY `l_chapter_id` (`chapter_id`),
                    CONSTRAINT `FK_l_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `chapters`(`id`)
                  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :lessons
  end
end
