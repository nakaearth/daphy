module Admin
  class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :destroy]

    def index
      @groups = current_user.my_groups
    end

    def show
      @members = @group.group_member_users
      # TODO: すでにgroupメンバーのものは除くようにする
      @friends = current_user.friend.friend_users
    end

    def new
      @group = Group.new
      @action = 'create'
    end

    def create
      if Groups::Registration.new.regist(group_params, current_user)
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

    def invite
      redirect_to action :index
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
