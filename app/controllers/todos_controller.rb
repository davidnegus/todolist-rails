class TodosController < ApplicationController
    def index
        @todo = Todo.new
        @todos = Todo.all
    end

    def create
        Todo.create(todos_params)

        redirect_to todos_path
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(todos_params)
        redirect_to todos_path
    end

    def destroy
        Todo.delete(params[:id])
        redirect_to todos_path
    end

    private

    def todos_params
        params.require(:todo).permit(:task, :status)
    end
end
