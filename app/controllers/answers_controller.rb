class AnswersController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   @answer = Answer.new
  # end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @answer.user = current_user

    if @answer.save
      redirect_to request.referrer, notice: 'Answer successfully created.'
    else
      redirect_to request.referrer, alert: @answer.errors.full_messages.join('. ').to_s
    end
    # redirect_to request.referrer
    
  end

  # def destroy
  #   @question = Question.find(params[:question_id])
  #   @answer = @question.answers.find(params[:id])
  #   @answer.destroy
  #   redirect_to question_path(@question)
  # end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
