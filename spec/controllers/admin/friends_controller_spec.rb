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

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET create" do
      it "returns http success" do
        post :create
        expect(response).to have_http_status(:found)
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
