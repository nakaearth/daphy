module Daphy
  class JobCardsController < ApplicationController
    before_action :set_job_card, only: [:show, :edit, :update, :destroy, :change_type, :recovery, :remove]
    before_action :set_groups, only: [:index, :new, :edit, :show, :trashed]

    def index
      if params[:group_id]
        @todos = JobCard.todos.where(group_id: params[:group_id]).page(1).per(20)
        @doings = JobCard.doings.where(group_id: params[:group_id]).page(1).per(20)
        @dones = JobCard.dones.where(group_id: params[:group_id]).page(1).per(20)
      else
        @todos = current_user.my_job_cards.todos.page(1).per(20)
        @doings = current_user.my_job_cards.doings.page(1).per(20)
        @dones = current_user.my_job_cards.dones.page(1).per(20)
      end
    end

    def new
      @job_card = JobCard.new
      @action = 'create'
    end

    def create
      ActiveRecord::Base.transaction do
        job_card = JobCard.new(job_params)
        job_card.type = :todo
        job_card.user = current_user
        job_card.group = current_user.my_groups[0]
        if job_card.save!
          flash[:notice] = "#{job_card.title}を追加しました"
          redirect_to action: :index
        else
          render action: :new
        end
      end
    end

    def edit
      @action = 'update'
    end

    def update
      ActiveRecord::Base.transaction do
        if @job_card.update(update_job_params)
          flash[:notice] = "#{@job_card.title}を更新しました"
          redirect_to action: :index
        else
          redner action: :edit
        end
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

    def recovery
      @job_card.type = :todo
      @job_card.save!
      redirect_to action: :trashed
    end

    def remove
      @job_card.destroy!
      flash[:notice] = '削除しました'
      redirect_to action: :trashed
    end

    def remove_all
      # TODO: ここ件数多かったら、あれだかれ後々非同期にする
      ActiveRecord::Base.transaction do
        current_user.trashed.destroy!
      end

      redirect_to action: :index
    end

    private

    def set_job_card
      @job_card = JobCard.find(params[:id])
    end

    def set_groups
      @groups = current_user.my_groups
      # @selected_group = Group.find(params[:group_id].presence) || current_user.my_groups[0]
    end

    def job_params
      params.require(:job_card).permit(:title, :description, :point) if params[:job_card]
    end

    def update_job_params
      if @job_card.todo?
        params.require(:todo).permit(:title, :description, :point) if params[:todo]
      elsif @job_card.doing?
        params.require(:doing).permit(:title, :description, :point) if params[:doing]
      end
    end
  end
end
