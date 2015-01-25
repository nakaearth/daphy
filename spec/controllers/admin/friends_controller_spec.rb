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

    describe 'GET friend_request' do
      let!(:group) { create(:group) }
      let!(:friend_user) { create(:user) }
      let!(:email_token) { create(:email_token, user: friend_user, group: group) }

      before do
        mail = InviteGroup.send_mail('test@gmail.com', email_token.token)
        allow(mail).to receive(:deliver).and_return(nil)
        get :friend_request, email: 'test@gmail.com', group_id: group.id
      end

      it 'return http success' do
        expect(response).to have_http_status(:success)
      end

      it 'EmailTokenに登録されたか' do
        email_token = EmailToken.find_by(user: user)
        expect(email_token).not_to be_nil
      end
    end

    describe 'GET confirm_friend_request' do
      let!(:friend_user) { create(:user) }
      let!(:email_token) { create(:email_token, user: friend_user, group: create(:group)) }
      let!(:friend_user_registration) { create(:friend_request_registration, user: user, request_from_user: friend_user.id) }

      before do
        get :confirm_friend_request, token: email_token.token
      end
      
      it 'return http success' do
        expect(response).to have_http_status(:found)
      end

      it 'show friend user attribte' do
        expect(EmailToken.exists?(id: email_token.id)).to be_falsy
      end
    end

    describe 'GET friend_request_registrations' do
      let!(:friend_user) { create(:user) }
      let!(:email_token) { create(:email_token, user: friend_user, group: create(:group)) }
      let!(:friend_user_registration) { create(:friend_request_registration, user: user, request_from_user: friend_user.id) }

      before do
        get :friend_request_registrations
      end

      it 'show friend list' do
        expect(assigns[:friend_request_registrations].count).to eq(1)
      end

      it 'show friend user attribte' do
        expect(assigns[:friend_request_registrations][0].name).to eq(friend_user.name)
      end
    end

    describe 'GET become_friend' do
      let!(:group) { create(:group) }
      let!(:friend_user) { create(:user) }
      let!(:friend2) { create(:friend, user: friend_user, friend_user_ids: '') }
      let!(:group_member) { create(:group_member, group: group, user: user) }
      let!(:friend_request) { create(:friend_request_registration, user: friend_user, request_from_user: user.id) }

      before do
        post :become_friend, friend_request_id: friend_request.id
      end

      it 'returns http found' do
        expect(response).to have_http_status(:found)
      end

      it 'friend登録' do
        friend_user.reload
        user.reload
        expect(friend_user.friend.friend_user_ids.split(',').size).to eq(1)
        expect(user.friend.friend_user_ids.split(',').size).to eq(6)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, id: user.friend.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET destroy" do
      it "returns http success" do
        delete :destroy, id: user.friend.id
        expect(response).to have_http_status(:found)
      end
    end

  end
end
