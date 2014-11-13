module Daphy
  class JobCardsController < ApplicationController
    before_action :set_job_card, only: [:show, :edit, :update, :change_type]

    def index
      @todos = current_user.my_job_cards.todos.page(1).per(20)
      @doings = current_user.my_job_cards.doings.page(1).per(20)
      @dones = current_user.my_job_cards.dones.page(1).per(20)
    end

    def new
      @job_card = JobCard.new
      @groups = current_user.group
    end

    def create
      job_card = JobCard.new(todo_params)
      job_card.type = 'Todo'
      job_card.user = current_user
      job_card.group = current_user.group
      if job_card.save!
        flash[:notice] = "#{job_card.title}を追加しました"
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
      @groups = current_user.group
    end

    def update
      @job_card.type = params[:type]
      @job_card.save!
    end

    def change_type
      # @job_card.type = params[:type]
      @job_card.type = 'Doing'
      @job_card.save!
    end

    def show
    end

    private

    def set_job_card
      @job_card = JobCard.find_by(id: params[:id], type: params[:type])
    end

    def todo_params
      params.require(:job_card).permit(:title, :description, :point) if params[:job_card]
    end
  end
end
