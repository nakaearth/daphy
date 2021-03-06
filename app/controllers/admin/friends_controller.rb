module Admin
  class FriendsController < ApplicationController
    before_action :set_frined, only: [:show, :destroy, :delete_relationship]

    def index
      Friend.create(user: current_user, friend_user_ids: '') unless current_user.friend
      @friends = current_user.friend.friend_users
    end

    def new
      @invite_email = InviteEmail.new
    end

    def friend_request
      token = SecureRandom.urlsafe_base64(15)
      ActiveRecord::Base.transaction do
        group = Group.find(params[:group_id])
        EmailToken.create(user: current_user, group: group, token: token)
      end
      FriendRequest.send_mail(params[:email], token).deliver
    end

    def confirm_friend_request
      email_token = EmailToken.find_by(token: params[:token])

      # TODO: ともだち申請テーブルに登録
      FriendRequestRegistration.create(user: current_user, request_from_user: email_token.user.id)
      email_token.destroy
      # ログイン&ユーザ登録
      redirect_to '/auth/' + (Rails.env.production? ? 'twitter' : 'developer')
    end

    def request_registrations
      @friend_request_registrations = current_user.friend_request_registrations
    end

    def become_friend
      Friends::BecomeFriendService.new.become_friend(params[:friend_request_id])
      redirect_to action: :index
    end

    def show
    end

    def destroy
      authorize @friend
      @friend.destroy
      redirect_to action: :index
    end

    def delete_relationship
      # authorize @friend
      friend_id = params[:friend_id]
      ids = @friend.friend_user_id_list.select { |arr| arr != friend_id }
      @friend.friend_user_ids = ids.join(',')
      @friend.save
      redirect_to action: :index
    end

    private

    def set_frined
      @friend = Friend.find(params[:id])
    end
  end
end
