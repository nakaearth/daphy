module Daphy
  class JobFoldersController < ApplicationController
    before_action :set_group
    before_action :set_job_folder, only: [:show, :edit, :update, :destroy]

    def index
      @job_folders = @group.job_folders
    end

    def new
      @job_folder = JobFolder.new
      @job_cards = current_user.my_job_cards.done
    end

    def create
      @job_folder = JobFolder.new
      selected_job_cards = JobCard.selected_job_cards(job_folder_params)
      @job_folder.job_cards << selected_job_cards if selected_job_cards

      if @job_folder.archive(job_folder_params)
        @job_cards = curreent_user.my_job_cards.done
        redirect_to action: :index, flash: 'アーカイブしました'
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      job_cards = JobCards.selected_job_cards(job_folder_params)
      @job_folder.job_cards.merge(job_cards)
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
    end

    private

    def set_group
      @group = Group.find(params[:group_id])
    end

    def set_job_folder
      @job_folder = JobFolder.find(params[:id])
    end

    def job_folder_params
      job_folder_params = {
        name: params[:name],
        job_cards_attributes: {
          ids: params[:ids]
        }
      }
      params.require(:job_folder).permit(job_folder_params) if params[:job_folder]
    end
  end
end
