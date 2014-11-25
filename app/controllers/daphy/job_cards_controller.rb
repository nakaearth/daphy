module Daphy
  class JobCardsController < ApplicationController
    before_action :set_job_card, only: [:show, :edit, :update, :destroy, :change_type]

    def index
      @todos = current_user.my_job_cards.todos.page(1).per(20)
      @doings = current_user.my_job_cards.doings.page(1).per(20)
      @dones = current_user.my_job_cards.dones.page(1).per(20)
    end

    def new
      @job_card = JobCard.new
      @groups = current_user.my_groups
      @action = 'create'
    end

    def create
      job_card = JobCard.new(job_params)
      job_card.type = 'Todo'
      job_card.user = current_user
      job_card.group = current_user.my_groups[0]
      if job_card.save!
        flash[:notice] = "#{job_card.title}を追加しました"
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
      @groups = current_user.my_groups
      @action = 'update'
    end

    def update
      if @job_card.update(update_job_params)
        flash[:notice] = "#{@job_card.title}を更新しました"
        redirect_to action: :index
      else
        redner action: :edit
      end
    end

    def change_type
      @job_card.type = params[:type]
      @job_card.save!
      render json: { status: 'ok' }
    end

    def show
    end

    def destroy
      flash[:notice] = "#{@job_card.title}を削除しました"
      @job_card.type = 'Trashed'
      @job_card.save!
      redirect_to action: :index
    end

    def trashed
      @trashes = current_user.my_job_cards.trashes
    end

    private

    def set_job_card
      @job_card = JobCard.find(params[:id])
    end

    def job_params
      params.require(:job_card).permit(:title, :description, :point) if params[:job_card]
    end

    def update_job_params
      if @job_card.type == 'Todo'
        params.require(:todo).permit(:title, :description, :point) if params[:todo]
      elsif @job_card.type == 'Doing'
        params.require(:doing).permit(:title, :description, :point) if params[:doing]
      end
    end
  end
end
