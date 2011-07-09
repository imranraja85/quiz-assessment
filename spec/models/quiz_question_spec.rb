require 'spec_helper'

describe QuizQuestion do
  #need to create these because of the foreign key constraints
  before(:all) do
    @language_course = Factory.create(:language_course)
    @chapter = Factory.create(:chapter, :language_course => @language_course)
    @lesson = Factory.create(:lesson, :chapter => @chapter)
  end

  context "when checking if an answer is correct" do
    it "returns true if passed a correct answer" do
      @question = Factory.create(:quiz_question, :lesson => @lesson)
      @question.correct_answer?("How old are you?").should be_true
    end 

    it "returns false if passed an incorrect answer" do
      @question = Factory.create(:quiz_question, :lesson => @lesson)
      @question.correct_answer?("Totally wrong answer").should be_false
    end 
  end

  context "when setting up choices for multiple choice" do
    before(:all) do
      @question = Factory.create(:quiz_question, :lesson => @lesson)
      @question2 = Factory.create(:quiz_question, :lesson => @lesson, :question => 'new question2', :answer => 'wrong answer2')
      @question3 = Factory.create(:quiz_question, :lesson => @lesson, :question => 'new question3', :answer => 'wrong answer3')
      @question4 = Factory.create(:quiz_question, :lesson => @lesson, :question => 'new question4', :answer => 'wrong answer4')
    end

    it "returns an array with 4 distinct answers" do
      @question.possible_choices.uniq.size.should == 4
    end 

    it "returns an array that contains the answer" do
      @question.possible_choices.should include("How old are you?")
    end
  end

end
