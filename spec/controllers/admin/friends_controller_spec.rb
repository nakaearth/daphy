require 'rails_helper'

module Admin
  RSpec.describe FriendsController, type: :controller do
    render_views

    let!(:user) { create(:user) }
    let!(:friend_users) { create_list(:user, 5) }

    before do
      allow(controller).to receive(:current_user) { user }
      allow(controller).to receive(:login?) { true }
      ids = ''
      friend_users.each do |f_user|
        ids += f_user.id.to_s + ','
      end
      create(:friend, user: user, friend_user_ids: ids)
    end

    describe 'GET index' do
      before do
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'render the :index template' do
        expect(response).to render_template :index
      end

      it '友達一覧を取得' do
        expect(assigns[:friends]).not_to be_nil
        expect(assigns[:friends].count).to eq(5)
      end
    end

    describe 'GET new' do
      before do
        get :new
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET become_friend' do
      let!(:group) { create(:group) }
      let!(:friend_user) { create(:user) }
      let!(:friend2) { create(:friend, user: friend_user, friend_user_ids: '') }
      let!(:group_member) { create(:group_member, group: group, user: user) }
      let!(:email_token) { create(:email_token, user: friend_user, group: group) }

      before do
        get :become_friend, token: email_token.token
      end

      it 'returns http success' do
        expect(response).to have_http_status(:found)
      end

      it 'friend登録' do
        friend_user.reload
        expect(friend_user.friend.friend_user_ids.split(',').size).to eq(1)
      end
    end

    describe "GET show" do
      it "returns http success" do
        # get :show
        # expect(response).to have_http_status(:success)
      end
    end

    describe "GET destroy" do
      it "returns http success" do
        # delete :destroy
        # expect(response).to have_http_status(:success)
      end
    end

  end
end
