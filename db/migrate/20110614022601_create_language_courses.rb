class CreateLanguageCourses < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `language_courses` (
                    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                    `language_name` varchar(80) NOT NULL default '' COMMENT 'Name of the language',
                    `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                    PRIMARY KEY  (`id`)
                  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :language_courses
  end
end
