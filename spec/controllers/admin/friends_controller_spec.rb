require 'rails_helper'

module Admin
  RSpec.describe FriendsController, type: :controller do
    render_views

    let!(:user) { create(:user) }

    before do
      allow(controller).to receive(:current_user) { user }
      allow(controller).to receive(:login?) { true }
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
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
        expect(response).to have_http_status(:success)
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
