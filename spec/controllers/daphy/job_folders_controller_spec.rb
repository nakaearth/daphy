require 'rails_helper'

RSpec.describe Daphy::JobFoldersController, type: :controller do
  it_should_behave_like 'BaseController'

  describe "GET #new" do
    it "returns http success", skip: true do
      get :new
      expect(response).to have_http_status(:success)
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
