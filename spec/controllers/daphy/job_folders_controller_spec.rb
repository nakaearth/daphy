require 'rails_helper'

module Daphy
  RSpec.describe JobFoldersController, type: :controller do
    render_views

    it_should_behave_like 'BaseController'

    let(:group) { create(:group) }
    let(:user) { create(:user) }
    let!(:done_list) { create_list(:job_card, 3, :done, user: user, group: group) }

    before do
      allow(controller).to receive(:current_user) { user }
      allow(controller).to receive(:login?) { true }
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, controller: 'daphy/job_folders', group_id: group.id
        expect(response).to have_http_status(:success)
      end

      context 'done job_card is not empty' do
        it 'job_cards is not nil' do
          get :new, controller: 'daphy/job_folders', group_id: group.id
          expect(assigns[:job_cards]).not_to be_nil
          expect(assigns[:job_cards].size).to eq(3)
        end
      end

      context 'done job_card is not empty' do
        let(:user2) { create(:user) }

        it 'job_cards is empty' do
          allow(controller).to receive(:current_user) { user2 }

          get :new, controller: 'daphy/job_folders', group_id: group.id
          expect(assigns[:job_cards].size).to eq(0)
        end
      end
    end

    describe "GET #create" do
      let(:params) do
      end

      it "returns http success", skip: true do
        post :create, params
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success", skip: true do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #update" do
      it "returns http success", skip: true do
        put :update
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success", skip: true do
        get :show
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #destroy" do
      it "returns http success", skip: true do
        delete :destroy
        expect(response).to have_http_status(:success)
      end
    end
  end
end
