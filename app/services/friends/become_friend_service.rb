module Friends
  class BecomeFriendService
    def execute
      # ここにしょりを書く
      ActiveRecord::Base.transaction do
        friend_request = FriendRequest.find(params[:id])

        # TODO: 友達申請テーブルから削除
        friend_request.destroy
      end
    end
  end
end
