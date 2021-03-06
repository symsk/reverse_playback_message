class QuizzesController < ApplicationController
  before_action :require_login, only: %i[new create]

  def index
    @easy_quizzes = Quiz.easy
    @normal_quizzes = Quiz.normal
    @hard_quizzes = Quiz.hard
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end
  
  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.save!
    redirect_to root_path
  end

  private

  def quiz_params
    params.require(:quiz).permit(:question, :answer, :difficulty).merge(user_id: current_user.id)
  end
end
