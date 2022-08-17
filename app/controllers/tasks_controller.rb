class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy ]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path(@task) }
        flash[:notice] = "Tarefa Criada com sucesso!"
        format.json { render :show, status: :created, location: @task }
      else
        flash.now[:alert] = @task.errors.full_messages.to_sentence
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path(@task) }
        flash[:notice] = "Tarefa atualizada com sucesso!"
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        flash[:alert] = @task.errors.full_messages.to_sentence
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      flash[:notice] = "Tarefa excluida com sucesso!"
      format.json { head :no_content }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :due_date, :done)
  end
end
