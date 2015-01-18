require 'rails_helper'

RSpec.describe FriendRequestRegistration, type: :model do
  let!(:user) { create(:user) }
  let!(:from_user) { create(:user) }
  let!(:friend_request) { create(:friend_request, user: user, request_from_user: from_user.id) }

  describe 'テーブル間の関連' do
    context 'have a relation to user class' do
      it { expect belong_to(:users) }
    end
  end

end
