require 'rails_helper'
module Daphy
  RSpec.describe JobCardsController, type: :controller do
    render_views

    let!(:group) { create(:group) }
    let!(:user) { create(:user) }
    let!(:group_member) { create(:group_member, user: user, group: group) }
    let!(:todo_list) { create_list(:job_card, 4, user: user, group: group) }
    let!(:doing_list) { create_list(:job_card, 5, :doing, user: user, group: group) }
    let!(:done_list) { create_list(:job_card, 3, :done, user: user, group: group) }

    before do
      allow(controller).to receive(:current_user) { user }
      allow(controller).to receive(:login?) { true }
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

    describe 'GET new' do
      before do
        get :new
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET edit' do
      before do
        get :edit, id: todo_list[0].id, type: 'Todo'
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET show' do
      it 'returns http success' do
        get :show, id: todo_list[1].id, type: 'Todo'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST create' do
      context '登録が正常にできるか' do
        before do
          params = { job_card: { title: 'test', description: 'hogehoge\nhoge', point: 1 } }
          post :create, params
        end

        it '登録成功してリダイレクトする' do
          expect(response).to have_http_status(:found)
        end

        it '登録されている' do
          job = Todo.find_by(title: 'test')
          expect(job).not_to be_nil
          expect(job.user_id).to eq(user.id)
          expect(job.description).to eq('hogehoge\nhoge')
        end
      end

      context '入力エラーがある場合' do
        let!(:params) { { job_card: { description: 'hogehoge\nhoge', point: 1 } } }

        it '画面表示される画面' do
          pending '入力エラーの場合のテストの書き方を再検討'
          expect(post :create, params).to render_template :new
        end

        it 'エラーが発生する' do
          pending '入力エラーの場合のテストの書き方を再検討'
          expect(post :create, params).to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    describe 'PUT update' do
      context '更新が正常にできるか' do
        before do
          param = { id: todo_list[0].id, todo: { title: 'test_2', description: 'hogehoge\nhoge2', point: 2 } }
          put :update, param
        end

        it '更新成功してリダイレクトする' do
          expect(response).to have_http_status(:found)
        end

        it '値が更新されている' do
          job = Todo.find_by(title: 'test_2')
          expect(job).not_to be_nil
          expect(job.user_id).to eq(user.id)
          expect(job.description).to eq('hogehoge\nhoge2')
        end
      end

      context '入力エラーがある場合' do
        before do
          @param = { id: todo_list[0], todo: { description: 'hogehoge\nhoge', point: 1 } }
        end

        it '画面表示される画面' do
          pending '入力エラーの場合のテストの書き方を再検討'
          expect(put :update, @param).to render_template :new
        end

        it 'エラーが発生する' do
          pending '入力エラーの場合のテストの書き方を再検討'
          expect(put :update, @param).to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    describe 'PUT recover' do
      context '更新が正常にできるか' do

      end
    end
  end
end
