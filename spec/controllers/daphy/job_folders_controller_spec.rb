require 'rails_helper'

RSpec.describe Daphy::JobFoldersController, type: :controller do
  it_should_behave_like 'BaseController'

  describe "GET #new" do
    let(:group) { create(:group) }
    let(:user) { create(:user) }

    before do
      allow(controller).to receive(:current_user) { user }
      allow(controller).to receive(:login?) { true }
    end

    it "returns http success", skip: true do
      get :new
      expect(response).to have_http_status(:success)
    end

    context 'done job_card is not empty' do
      let(:doing_list) { create_list(:job_card, 5, :doing, user: user, group: group) }

      it'job_cards is not nil', skip: true do
        get :new
        expect(assigns[:job_cards]).not_to be_nil
        expect(assigns[:job_cards].size).to eq(5)
      end
    end

    context 'done job_card is not empty' do
      let(:doing_list) { nil }

      it 'job_cards is empty', skip: true do
        get :new
        expect(assigns[:job_cards]).to be_nil
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
