# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: [:destroy, :update, :edit, :show]

  def index
    @tasks = @current_user.tasks
  end

  def new
    @task = Task.new
  end

  def edit; end

  def show; end

  def create
    @task = @current_user.tasks.new(task_params)
    if @task.save
      # Notificar serviço de notificações
      NotificationService.notify(@task)
      redirect_to task_url(@task), notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      NotificationService.notify(@task)
      redirect_to task_path(@task), notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private

  def find_task
    @task = @current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:url)
  end
end
