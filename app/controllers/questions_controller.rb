class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
      redirect_to questions_path
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :user_id)
    end
end
