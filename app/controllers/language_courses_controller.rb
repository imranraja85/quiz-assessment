class LanguageCoursesController < ApplicationController
  def index
    @language_courses = LanguageCourse.all
  end

  def assessment
    @language_course = LanguageCourse.find(params[:id]) 
    @quiz_questions = @language_course.create_assessment
  end

  def evaluate_assessment
    questions_to_check = params[:questions] ? params[:questions].first : {}
    @result = LanguageCourse.grade_assessment(questions_to_check)
  end
end
