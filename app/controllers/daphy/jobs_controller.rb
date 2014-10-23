class Daphy::JobsController < ApplicationController
  def index
    @todo_job_cards = TodoJobCard.all
    @doing_Job_cards = DoingJobCard.all
    @done_job_cards = DoneJobCard.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
