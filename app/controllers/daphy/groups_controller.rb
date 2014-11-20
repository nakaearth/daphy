module Daphy
  class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :destroy]

    def index
      @groups = current_user.my_groups
    end

    def show
    end

    def new
      @group = Group.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_group
      @group = Group.find(params[:id])
    end
  end
end
