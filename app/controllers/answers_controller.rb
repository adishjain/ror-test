class AnswersController < ApplicationController
def create
	question2 = Question.find(params[:answer][:question_id])
	question2.answers.create(answer_params)
	redirect_to question2
end

private
def answer_params
	params.required(:answer).permit(:email,:body)
end

end
