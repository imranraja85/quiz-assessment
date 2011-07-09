# Created On 2012-06-15 - IR
class Chapter < ActiveRecord::Base
  ### REQUIRES/INCLUDES ###
  
  ### ASSOCIATIONS ###
  has_many :lessons
  has_many :quiz_questions, :through => :lessons
  belongs_to :language_course
  
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
  
  ### CLASS METHODS ###
  
  ### OBJECT METHODS ###

  private
    
    ### VALIDATION METHODS ###    

    ### CALLBACK METHODS ### 
       
    ### OTHER PRIVATE METHODS ### 
  
end
