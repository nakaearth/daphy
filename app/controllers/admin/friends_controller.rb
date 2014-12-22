module Admin
  class FriendsController < ApplicationController
    before_action :set_frined, only: [:show, :destroy]

    def index
      @friends = current_user.friend.friend_users
    end

    def new
      @invite_email = InviteEmail.new
    end

    def create
      redirect_to action: :index
    end

    def show
    end

    def destroy
    end

    private

    def set_frined
      @friend = Friend.find(params[:id])
    end
  end
end
