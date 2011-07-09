# Created On 2012-06-15 - IR
class LanguageCourse < ActiveRecord::Base
  ### REQUIRES/INCLUDES ###

  ### ASSOCIATIONS ###
  has_many :chapters
  has_many :lessons, :through => :chapters

  ### VALIDATIONS AND CALLBACKS ###
    # before_validation
  # ------------- #
    # validation
  # ------------- # 
    # after_validation
  
  ### NAMED SCOPES ###

  ### CONDITIONALS ###
  
  ### CLASS METHODS ###
  #Checks the questions and answers being passed in and creates
  #a hash the stores the correct and incorrect answers.
  def self.grade_assessment(hash_of_questions)
    questions_results = Hash.new{|h, k| h[k] = []}

    hash_of_questions.each_pair do |question_type, questions|
      questions.first.each_pair do |question_id, selected_answer|
        question = QuizQuestion.where(:id => question_id).first
        if question.correct_answer?(selected_answer) 
          questions_results[:correct_answers] << question
        else
          questions_results[:incorrect_answers] << question
        end
      end
    end
    
    questions_results
  end
  
  ### OBJECT METHODS ###

  # The create_assessment method constructs an array of 50 questions.
  # The 50 questions are composed one question from each lesson.
  # 70% of the questions are multiple choice and 30% are fill ins.
  # In order to ensure the type twos of questions are randomly distributed,
  # the lessons are shuffled before breaking up the two different types of questions.
  def create_assessment
    @unique_questions = []

    questions = QuizQuestion.for_language_course(self, ["multiple_choice", "short_answer"])
    questions_grouped_by_lesson = questions.group_by(&:lesson_id).values.shuffle

    setup_multiple_choice_questions(questions_grouped_by_lesson)
    setup_short_answer_questions(questions_grouped_by_lesson)

    @unique_questions
  end

  private
    ### VALIDATION METHODS ###    

    ### CALLBACK METHODS ### 
       
    ### OTHER PRIVATE METHODS ### 
  
    #Setups up 35 type A questions. Randomly adds a multiple choice question from each lesson.
    def setup_multiple_choice_questions(questions)
      questions[0..34].each do |questions_in_a_lesson|
        @unique_questions << questions_in_a_lesson.find_all{|question| question.question_type == 'multiple_choice'}[rand(6)]
      end
    end

    #setups up 15 type B questions. Randomlys add a short answer question from each lesson.
    def setup_short_answer_questions(questions)
      questions[35..50].each do |questions_in_a_lesson|
        @unique_questions << questions_in_a_lesson.find_all{|question| question.question_type == 'short_answer'}[rand(2)]
      end
    end
end
