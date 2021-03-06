module Daphy
  class JobFoldersController < ApplicationController
    before_action :set_group
    before_action :set_job_folder, only: [:show, :edit, :update, :destroy]
    before_action :set_done_job_card, only: [:new, :create, :edit, :update]

    def index
      @job_folders = @group.job_folders
    end

    def show
    end

    def new
      @job_folder = current_group.job_folders.build
    end

    def create
      @job_folder = current_group.job_folders.build(job_folder_params)

      if @job_folder.archive(job_folder_params)
        redirect_to action: :index, flash: 'アーカイブしました'
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      @job_folder.build(job_folder_params)
      if @job_folder.archive(job_folder_params)
        redirect_to action: :index, flash: 'アーカイブしました'
      else
        render action: :edit
      end
    end

    def show
    end

    def destroy
      @job_folder.destroy
      redirect_to action: :index, flash: '削除しました'
    end

    private

    def set_group
      @group = Group.find(Base64.decode64(params[:group_id]))
    end

    def set_done_job_card
      @done_job_cards = current_user.my_job_cards.done
    end

    def set_job_folder
      @job_folder = JobFolder.find(Base64.decode64(params[:encoded_id]))
    end

    def job_folder_params
      job_folder_params = [
        :name,
        job_cards_attributes: [
          :job_card_id
        ]
      ]
      params.require(:job_folder).permit(job_folder_params) if params[:job_folder]
    end
  end
end
