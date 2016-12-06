class TasksController < ApplicationController

  before_action :find_subject
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



    private

    def task_params
      params.require(:task).permit(:description, :score, :rating, :prof_answer, :task_type)
    end

    def find_subject
      @subject = Subject.find(params[:subject_id])
    end

end
