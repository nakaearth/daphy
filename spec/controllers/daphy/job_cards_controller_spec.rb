require 'rails_helper'
module Daphy
  RSpec.describe JobCardsController, type: :controller do
    render_views

    let!(:group) { create(:group) }
    let!(:user) { create(:user, group: group) }
    let!(:todo_list) { create_list(:job_card, 4, user: user, group: group) }
    let!(:doing_list) { create_list(:job_card, 5, :doing, user: user, group: group) }
    let!(:done_list) { create_list(:job_card, 3, :done, user: user, group: group) }

    before do
      allow(controller).to receive(:current_user) { user }
      allow(controller).to receive(:login?) { true }
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'Todoタスクの一覧が返される' do
        expect(assigns[:todos]).not_to be_nil
        expect(assigns[:todos].size).to eq(4)
      end

      it 'Doingタスクの一覧が変えされる' do
        expect(assigns[:doings]).not_to be_nil
        expect(assigns[:doings].size).to eq(5)
      end

      it 'Doneタスクの一覧が変えされる' do
        expect(assigns[:dones]).not_to be_nil
        expect(assigns[:dones].size).to eq(3)
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
        get :edit, id: todo_list[0].id, type: 'Todo'
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, id: todo_list[1].id, type: 'Todo'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST create' do
    end
  end
end
