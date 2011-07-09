class CreateQuizQuestions < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `quiz_questions` (
                    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                    `lesson_id` INT(11) UNSIGNED COMMENT 'Foreign key to lessions table',
                    `question` VARCHAR(255) NOT NULL COMMENT 'Assessment question',
                    `answer` VARCHAR(255) NOT NULL COMMENT 'Answer for the assessment question',
                    `question_type` enum('multiple_choice','short_answer') NOT NULL COMMENT 'Type of question',
                    `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                    PRIMARY KEY  (`id`),
                    KEY `qq_lesson_id` (`lesson_id`),
                    CONSTRAINT `FK_qq_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons`(`id`)
                  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :quiz_questions
  end
end
