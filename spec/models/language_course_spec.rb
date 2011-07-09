require 'spec_helper'

describe LanguageCourse do
  context "when evaluating an assessment" do
    it "returns an empty array for correct answers if no questions are passed in" do
      LanguageCourse.grade_assessment({})[:correct_answers].should == []
    end

    it "returns an array of correct answers if only 1 correct answer is submitted" do
      @question = Factory.create(:quiz_question, :lesson => @lesson)
      result = LanguageCourse.grade_assessment({"multiple_choice"=>[{"#{@question.id}"=>"How old are you?"}]})
      result[:correct_answers].size.should == 1
      result[:incorrect_answers].size.should == 0
    end

    it "returns an array of incorrect answers if only 1 incorrect answer is submitted" do
      @question = Factory.create(:quiz_question, :lesson => @lesson)
      result = LanguageCourse.grade_assessment({"multiple_choice"=>[{"#{@question.id}"=>"This is the wrong answer"}]})
      result[:incorrect_answers].size.should == 1
      result[:correct_answers].size.should == 0
    end

    it "returns the correct answers for different types of questions" do
      @question = Factory.create(:quiz_question, :lesson => @lesson)
      @question_short_answer = Factory.create(:quiz_question, :lesson => @lesson, :question => 'short answer question', :answer => 'short answer')

      LanguageCourse.grade_assessment({"multiple_choice"=>[{"#{@question.id}"=>"How old are you?"}],
                                              "short_answer"=> [{"#{@question_short_answer.id}"=>"short answer"}]})[:correct_answers].size.should == 2
    end

    it "returns the correct and incorrect answers for different types of questions" do
      @question = Factory.create(:quiz_question, :lesson => @lesson)
      @question_short_answer = Factory.create(:quiz_question, :lesson => @lesson, :question => 'short answer question', :answer => 'short answer')

      result = LanguageCourse.grade_assessment({"multiple_choice"=>[{"#{@question.id}"=>"How old are you?"}],
                                                "short_answer"=> [{"#{@question_short_answer.id}"=>"wrong answer"}]})
      result[:correct_answers].size.should == 1
      result[:incorrect_answers].size.should == 1
    end
  end
end
