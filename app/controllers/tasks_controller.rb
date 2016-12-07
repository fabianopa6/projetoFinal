class TasksController < ApplicationController

  before_action :find_subject
  before_action :find_task, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  def new
    @task = Task.new
  end


  def create
    @task = Task.new(task_params)
    @task.subject_id = @subject.id
    @task.user_id = current_user.id

    if @task.save
      redirect_to subject_path(@subject)
    else
      render 'new'
    end
  end

    def destroy
      @task.destroy
      redirect_to subject_path(@subject)
    end

  def edit
    @task = Task.find(params[:id])
  end

  def update


    if @task.update(task_params)
      redirect_to subject_path(@subject)
    else
      render 'edit'
    end
  end

    private

    def task_params
      params.require(:task).permit(:description, :score, :rating, :prof_answer, :task_type)
    end

    def find_subject
      @subject = Subject.find(params[:subject_id])
    end

    def find_task
      @task = Task.find(params[:id])
    end

end
