class AnswersController < ApplicationController

  before_action :find_task, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  def index
    @answers = Answer.all.order("created_at DESC")
  end


  def show
    @answers = Answer.all.order("created_at DESC")
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy

  end

  def update

  end

  private

    def answer_params
      params.require(:answer).permit(:task_answer, :user_id, :task_id)
    end

    def find_task
      @task = Task.find(params[:id])
    end

end
