# Created On 2012-06-15 - IR
class QuizQuestion < ActiveRecord::Base
  ### REQUIRES/INCLUDES ###
  
  ### ASSOCIATIONS ###
  belongs_to :lesson

  ### STATIC VARIABLES ###
  
  ### ACCESSOR ATTRIBUTES ###
  
  ### VALIDATIONS AND CALLBACKS ###
    # before_validation
  # ------------- #
    # validation
  # ------------- # 
    # after_validation
  
  ### NAMED SCOPES ###

  ### CONDITIONALS ###

  #evaluates whether the passed in string matches the answer
  def correct_answer?(selected_answer)
    answer == selected_answer
  end
  
  ### CLASS METHODS ###
  #returns all the questions for a language course
  def self.for_language_course(language_course, question_types)
    QuizQuestion.all(:select => "q.*",
                     :from => "quiz_questions q",
                     :joins => "INNER JOIN lessons l ON q.lesson_id = l.id
                                INNER JOIN chapters c ON c.id = l.chapter_id
                                INNER JOIN language_courses lc ON lc.id = c.language_course_id",
                     :conditions =>  ["lc.id = ? and question_type IN (?)", language_course, question_types])
  end
  
  ### OBJECT METHODS ###
  #creates an array of 4 choices for the multiple choice questions
  def possible_choices
    return false if question_type != 'multiple_choice' 
    random_answers = QuizQuestion.where(["question_type = 'multiple_choice' and id != ? and lesson_id = ?", id, lesson_id]).select("answer").shuffle.first(3).collect {|q| q.answer}

    ([answer] | random_answers).shuffle
  end

 private
    
    ### VALIDATION METHODS ###    

    ### CALLBACK METHODS ### 
       
    ### OTHER PRIVATE METHODS ### 

end
