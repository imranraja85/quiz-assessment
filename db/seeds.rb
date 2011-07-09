# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

["Spanish", "French", "German"].each do |language|
  puts "Seeding #{language} Language Course"
  @language_course = LanguageCourse.create(:language_name => language)

  (1..5).to_a.each do |chapter_number|
    puts "Seeding Chapters"
    @chapter = Chapter.create(:chapter_number => chapter_number, :language_course_id => @language_course.id)

    (1..10).to_a.each do |lesson_number|
      puts "Seeding Lessons"
      @lesson = Lesson.create(:lesson_number => lesson_number, :chapter_id => @chapter.id)

      (1..10).to_a.each do |quiz_question|
        puts "Seeding Quiz Questions"

        #set 70% of the quiz questions to have a particular question_type
        question_type = case quiz_question
                        when 1..7
                          'multiple_choice'
                        else
                          'short_answer'
                        end

        QuizQuestion.create(:lesson_id => @lesson.id,
                            :question => "#{language} chapter#{chapter_number} lesson#{lesson_number} question #{quiz_question}",
                            :answer => "#{language} chapter#{chapter_number} lesson#{lesson_number} answer #{quiz_question}",
                            :question_type => question_type)

      end #end of quiz questions loop
    end #end of lesson loop
  end #end of chapter number loop
end 
