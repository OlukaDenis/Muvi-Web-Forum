class QuestionsController < ApplicationController
  http_basic_authenticate_with name: "denis", password: "15qwerty", 
  except: [:index, :show]
  def index
    @questions = Question.all
    # render json: @questions
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      # format.json { render json: @question, status: :created }
      
      redirect_to @question
    else
      # format.json { render json: @question.errors, status: :unprocessable_entity }
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
    # render json: @question
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
