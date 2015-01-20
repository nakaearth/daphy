require 'rails_helper'

module Friends
  describe BecomeFriendService do
    let!(:user) { create(:user) }
    let!(:friend_users) { create_list(:user, 5) }
    let!(:group) { create(:group) }
    let!(:friend_user) { create(:user) }
    let!(:friend) do
      ids = ''
      friend_users.each do |f_user|
        ids += f_user.id.to_s + ','
      end
      create(:friend, user: user, friend_user_ids: ids)
    end
    let!(:friend2) { create(:friend, user: friend_user, friend_user_ids: '') }
    let!(:group_member) { create(:group_member, group: group, user: user) }
    let!(:friend_request) { create(:friend_request, user: friend_user, request_from_user: user.id) }

    context '友達になる' do
      before do
        Friends::BecomeFriendService.new.become_friend(friend_request)
      end

      it '友達になる' do
        friend.reload
        expect(friend.friend_user_ids.split(',').count).to eq(6)
      end

      it 'friend_requestからデータが削除される' do
        expect(FriendRequestRegistration.exists?(user: friend_user, request_from_user: user.id)).to be_falsy
      end
    end
  end
end
