module Daphy
  class JobFolderController < ApplicationController
    before_action :set_group, :set_job_folder

    def new
    end

    def create
      job_cards = JobCards.selected_job_cards(job_folder_params)
      @job_folder.job_cards = job_cards
      if @job_folder.archive(job_folder_params)
        redirect_to action: :index, flash: 'アーカイブしました'
      else
        render action: :new
      end
    end

    def edit
    end

    def update
    end

    def show
    end

    def destroy
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
        job_folder: {
          name: params[:name],
          job_cards_attributes: {
            ids: params[:job_cards_attributes][:ids]
          }
        }
      }
      # TODO: ここ編集
      params.require(:job_folder).permit(:name) if params[:job_folder]
    end
  end
end
