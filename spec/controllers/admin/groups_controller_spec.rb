require 'rails_helper'

module Admin
  RSpec.describe GroupsController, type: :controller do
    render_views

    let!(:user) { create(:user) }
    let!(:groups) { create_list(:group, 10) }
    let!(:group_member1) { create(:group_member, user: user, group: groups[0], owner: true) }
    let!(:group_member2) { create(:group_member, user: user, group: groups[1], owner: true) }

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

      it '自分が所属するグループの一覧が表示される' do
        expect(assigns[:groups]).not_to be_nil
        expect(assigns[:groups].size).to eq(3)
      end
    end

    describe 'POST create' do
      let!(:params) { { group: { name: 'ほげほげぐるーぷ' } } }

      before do
        post :create, params
      end

      it '登録成功してリダイレクトする' do
        expect(response).to have_http_status(:found)
      end

      it '新しくgroupが登録される' do
        group = Group.find_by(name: 'ほげほげぐるーぷ')
        expect(group).not_to be_nil
        expect(group.name).to eq('ほげほげぐるーぷ')
      end

      it 'group_memberにグループのownerとして登録される' do
        group = Group.find_by(name: 'ほげほげぐるーぷ')
        group_member = GroupMember.find_by(group: group, user: user)

        expect(group_member).not_to be_nil
      end
    end
  end
end
