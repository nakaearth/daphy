require 'rails_helper'

RSpec.describe FriendRequestRegistration, type: :model do
  let!(:user) { create(:user) }
  let!(:friend_user) { create(:user) }
  let!(:friend_request) { create(:friend_request_registration, user: friend_user, request_from_user: user.id) }

  describe 'テーブル間の関連' do
    context 'have a relation to user class' do
      it { expect belong_to(:users) }
    end
  end
end
