require 'rails_helper'

module Admin
  RSpec.describe GroupsController, type: :controller do
    render_views

    let!(:group) { create(:group) }
    let!(:user) { create(:user, group: group) }

    before do
      allow(controller).to receive(:current_user) { user }
      allow(controller).to receive(:login?) { true }
    end

    describe "GET index" do
      before do
        get :index
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it 'render the :index template' do
        expect(response).to render_template :index
      end

    end
  end
end
