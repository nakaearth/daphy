module Admin
  class FriendsController < ApplicationController
    def index
      @friends = current_user.friend.friend_users
    end

    def new
    end

    def create
    end

    def show
    end

    def destroy
    end
  end
end
