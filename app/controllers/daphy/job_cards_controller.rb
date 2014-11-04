module Daphy
  class JobCardsController < ApplicationController
    before_action :set_job_card, only: [:show, :edit]

    def index
      @job_card = Todo.new
      @todos = current_user.my_job_cards.todos.page(1).per(20)
      @doings = current_user.my_job_cards.doings.page(1).per(20)
      @dones = current_user.my_job_cards.dones.page(1).per(20)
    end

    def new
      @job_card = Todo.new
    end

    def create
      job_card = Todo.new(todo_params)
      job_card.user = current_user
      job_card.group = current_user.group
      if job_card.save
        redirect_to action: :show, id: job_card.id
      else
        render action: :new
      end
    end

    def edit
    end

    def show
    end

    private

    def set_job_card
      @job = JobCard.where(id: params[:id], type: params[:type])
    end

    def todo_params
      params.require(:job_card).permit(:title, :description) if params[:job_card]
    end
  end
end
