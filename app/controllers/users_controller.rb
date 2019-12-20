class UsersController < ApplicationController
  def new
     @question = Question.new
  end
end
