# Created On 2012-06-15 - IR
class Lesson < ActiveRecord::Base
  ### REQUIRES/INCLUDES ###
  
  ### ASSOCIATIONS ###
  has_many :quiz_questions
  belongs_to :chapter

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
