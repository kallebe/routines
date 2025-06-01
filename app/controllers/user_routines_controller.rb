class UserRoutinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_routines = current_user.user_routines
    render json: @user_routines, status: :ok
  end

  def create
    @user_routine = current_user.user_routines.new(user_routine_params)
    if @user_routine.save
      render json: @user_routine, status: :created
    else
      render json: @user_routine.errors, status: :unprocessable_entity
    end
  end

  def update
    @user_routine = current_user.user_routines.find(params[:id])
    if @user_routine.update(user_routine_params)
      render json: @user_routine, status: :ok
    else
      render json: @user_routine.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_routine = current_user.user_routines.find(params[:id])
    if @user_routine.destroy
      render json: { message: 'Routine deleted successfully' }, status: :ok
    else
      render json: @user_routine.errors, status: :unprocessable_entity
    end
  end

  private

  def user_routine_params
    params.require(:user_routine).permit(:title, :days_of_week)
  end
end
