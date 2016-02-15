class AnswersController < ApplicationController
def create
	question2 = Question.find(params[:answer][:question_id])
	answer = question2.answers.create(answer_params)
	MainMailer.notify_question_author(answer).deliver_now
	
	session[:current_user_email] = answer_params[:email]
	redirect_to question2
end

private
def answer_params
	params.required(:answer).permit(:email,:body)
end

end
