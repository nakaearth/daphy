module Admin
  class FriendsController < ApplicationController
    before_action :set_frined, only: [:show, :destroy]

    def index
      Friend.create(user: current_user, friend_user_ids: '') unless current_user.friend
      @friends = current_user.friend.friend_users
    end

    def new
      @invite_email = InviteEmail.new
    end

    def friend_request
      # 友達申請
      ActiveRecord::Base.transaction do
        token = SecureRandom.urlsafe_base64(15)
        group = Group.find(params[:group_id])
        EmailToken.create(user: current_user, group: group, token: token)
      end
      # メール送信
      InviteGroup.send_mail(params[:email], token).deliver
    end

    def become_friend
      ActiveRecord::Base.transaction do
        # メール送付後、トークンテーブルから送ったユーザの情報を取得し、
        # 友達関係をデータにとうろくする
        email_token = EmailToken.find_by(token: params[:token])
        redirect_to controller: 'sessions', action: 'new' if email_token
      end
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
