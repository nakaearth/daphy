module Friends
  class BecomeFriendService
    def become_friend(friend_request_id)
      # ここにしょりを書く
      ActiveRecord::Base.transaction do
        friend_request = FriendRequestRegistration.find(friend_request_id)
        friend_request.user.friend.become_friend(friend_request.request_from_user)
        user = User.find(friend_request.request_from_user)
        user.friend.become_friend(friend_request.user.id)
        # TODO: 友達申請テーブルから削除
        friend_request.destroy
      end
    end
  end
end
