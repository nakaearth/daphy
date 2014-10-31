module Daphy
  class JobCardsController < ApplicationController
    before_action :set_job_card, only: [:show, :edit]

    def index
      @todos = current_user.my_job_cards.todos.page(1).per(20)
      @doings = current_user.my_job_cards.doings.page(1).per(20)
      @dones = current_user.my_job_cards.dones.page(1).per(20)
    end

    def new
      @todo = Todo.new
    end

    def edit
    end

    def show
    end

    private

    def set_job_card
      @job = JobCard.where(id: params[:id], type: params[:type])
    end
  end
end
