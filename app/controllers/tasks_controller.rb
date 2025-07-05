class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.includes(:category).joins(:category).order('categories.title ASC, tasks.title ASC')
    render json: @tasks.as_json(include: :category), status: :ok
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    if @task.destroy
      render json: { message: 'Task deleted successfully' }, status: :ok
    else
      render json: @task.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :duration, :category_id)
  end

end
