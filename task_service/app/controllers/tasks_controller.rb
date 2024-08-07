# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_request!
  before_action :find_task, only: %i[destroy update edit show]
  include TaskHelper

  def index
    @tasks = @current_user.tasks
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = @current_user.tasks.new(task_params)
    if @task.save
      NotificationService.notify(@task)
      ScrapingService.notify(@task)
      redirect_to tasks_url, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      NotificationService.notify(@task)
      ScrapingService.notify(@task)
      redirect_to tasks_url, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def find_task
    @task = @current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:url)
  end
end
