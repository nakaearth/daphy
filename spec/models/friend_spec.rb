require 'rails_helper'

RSpec.describe Friend, type: :model do
  let!(:user) { create(:user) }
  let!(:friend_users) { create_list(:user, 5) }
  
  describe '幾つかのテーブルと関連を持っている' do
    it { expect belong_to(:users) }
  end
  
  describe 'friend_users' do
    before do
      ids = ''
      friend_users.each do |f_user|
        ids += f_user.id.to_s + ','
      end
      @friend = create(:friend, user: user, friend_user_ids: ids)
    end

    it '友達の情報が5人分取得できる' do
      expect((@friend.friend_users).count).to eq(5)
    end

    it '友達の情報が取得できる' do
      expect((@friend.friend_users)[0]).to eq(friend_users[4])
    end
  end
end
