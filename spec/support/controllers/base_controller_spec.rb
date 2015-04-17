require 'rails_helper'

shared_examples_for "BaseController" do
  render_views

  let!(:group) { create(:group) }
  let!(:user) { create(:user) }
  let!(:group_member) { create(:group_member, user: user, group: group) }

  before do
    allow(controller).to receive(:current_user) { user }
    allow(controller).to receive(:login?) { true }
  end

  describe '#user.my_groups' do
    it { expect(user.my_groups.size).to eq(2) } 
  end
end
