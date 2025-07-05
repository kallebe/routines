class TaskRoutinesController < ApplicationController
  before_action :set_task_routine, only: [:update, :destroy]

  def create
    @task_routine = TaskRoutine.new(task_routine_params)
    if @task_routine.save
      render json: @task_routine, status: :created
    else
      render json: @task_routine.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end

  def update
    if @task_routine.update(task_routine_params)
      render json: @task_routine
    else
      render json: @task_routine.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end

  def destroy
    if @task_routine.destroy
      render json: { message: 'Task routine deleted successfully' }, status: :ok
    else
      render json: @task_routine.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end

  private

  def set_task_routine
    @task_routine = TaskRoutine.find(params[:id])
  end

  def task_routine_params
    params.require(:task_routine).permit(:start, :end, :user_routine_id, :task_id)
  end
end