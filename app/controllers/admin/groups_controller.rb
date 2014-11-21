module Admin
  class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :destroy]

    def index
      # @groups = current_user.my_groups
    end

    def show
    end

    def new
      @group = Group.new
      @action = 'create'
    end

    def create
      @group = Group.new(group_params)
      @group.user = current_user
      if @group.save
        flash[:notice] = 'グループを作成しました'
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
      @action = 'update'
    end

    def update
      @group.user = current_user
      if @group.save
        flash[:notice] = '編集完了しました'
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      @group.destroy
      redirect_to action: :index
    end

    private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name) if params[:group]
    end
  end
end
