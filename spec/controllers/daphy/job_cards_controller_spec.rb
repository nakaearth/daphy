require 'rails_helper'
module Daphy
  RSpec.describe JobCardsController, type: :controller do
    render_views

    let!(:group) { create(:group) }
    let!(:user) { create(:user, group: group) }
    let!(:job_cards) { create_list(:job_card, 4, user: user, group: group) }

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

    describe "GET edit" do
      it "returns http success" do
        get :edit, id: job_cards[0].id, type: 'Todo'
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, id: job_cards[1].id, type: 'Todo'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST create' do
    end
  end
end
