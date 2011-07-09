module LanguageCoursesHelper
  def prepare_question_choices(question)
    case question.question_type
    when 'multiple_choice'
      create_multiple_choice_fields(question)
    when 'short_answer'
      create_short_answer_fields(question)
    end
  end

  # Creates a list of choices used to populate the multiple choice questions.
  # There is a hidden li element with the default set to selected because we
  # want questions that are left blank to be submitted when the the form is submitted.
  def create_multiple_choice_fields(question)
    choices = question.possible_choices
    radio_name = "questions[]#{question.question_type}[]#{question.id}"

    html = ""
    html << "<ul class='no-list'>"
    choices.each do |choice|
      radio_id = "questions[]#{question.question_type}[]#{question.id}_#{choice}"
      radio_name = "questions[]#{question.question_type}[]#{question.id}"
      html << "<li> #{radio_button_tag(radio_name, choice)} #{label_tag radio_id, choice }</li>"
    end
    html << "<li class='hidden'>#{radio_button_tag(radio_name, "", :check => true)} </li>"
    html << "</ul>"
    raw(html)
  end
  
  def create_short_answer_fields(question)
    textbox_name = "questions[]#{question.question_type}[]#{question.id}"
    html = ""
    html << text_field_tag(textbox_name, nil, {:size => 50, :placeholder => "Enter your answer"})
    raw(html)
  end

  def display_assessment_comment(number_correct)
    case number_correct
    when 50
      "Excellent! You got a perfect score"
    when 41..49
      "Great job! You did very well"
    when 31..40
      "Good score! Keep on practicing"
    when 10..30
      "Keep on practicing buddy"
    else 
      "I'm embarrassed for you"
    end
  end
end
