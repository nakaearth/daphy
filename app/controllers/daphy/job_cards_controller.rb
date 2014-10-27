module Daphy
  class JobCardsController < ApplicationController
    before_action :set_event, only: [:show, :edit]

    def index
      @todos = Todo.all
      @doings = Doing.all
      @dones = Done.all
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
      @job = JobCard.find(params[:id])
    end
  end
end
