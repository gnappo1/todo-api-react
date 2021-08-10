class TodosController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_todo, only: [:show, :update, :destroy]
  before_action :unauthorized_check, only: [:update, :destroy]

  # GET /todos
  def index
    todos = Todo.all
    render json: todos
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    byebug
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
 
  end

  # DELETE /todos/1
  def destroy
    byebug
    if @todo.destroy
      render json: {message: "Successfully destroyed todo!"}
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.permit(:title, :user_id, :body, :completed, :completion_time, :avatar, :attachment)
    end

    def unauthorized_check
      if !@todo || @todo.user != current_user
        render json: "You are not authorized to visit this page", status: :unprocessable_entity
      end

    end
end
