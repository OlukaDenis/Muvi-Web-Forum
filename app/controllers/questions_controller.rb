class QuestionsController < ApplicationController
  # http_basic_authenticate_with name: "denis", password: "15qwerty", except: [:index, :show]
  before_action :logged_in_user, only: [:create, :destroy, :new]
  before_action :correct_user,   only: :destroy
  
  def index
    @questions = Question.paginate(page: params[:page])
    if logged_in?
      @question = current_user.questions.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def create
    # @question = Question.new(question_params)
    @question = current_user.questions.build(question_params)
    if @question.save
      # format.json { render json: @question, status: :created } 
      @feed_items = [] #Adding an (empty) @feed_items instance variable to the create action.     
      redirect_to questions_path
    else
      # format.json { render json: @question.errors, status: :unprocessable_entity }
      render root_url
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
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to request.referrer || root_url
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :picture)
    end

    def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to root_url if @question.nil?
    end
end
