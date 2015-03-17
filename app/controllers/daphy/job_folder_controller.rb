module Daphy
  class JobFolderController < ApplicationController
    before_action :set_group, :set_job_folder

    def new
    end

    def create
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
  end
end
