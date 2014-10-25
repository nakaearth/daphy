class Daphy::JobCardsController < ApplicationController
  def index
    @todos = Todo.all
    @doings = Doing.all
    @dones = Done.all
  end

  def new
    @todo = Todo.new
  end

  def edit
    @job = JobCard.find(params[:id])
  end
end
