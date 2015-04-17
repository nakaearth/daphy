require 'rails_helper'

shared_examples_for "BaseController" do
  render_views

  let!(:group) { create(:group) }
  let!(:user) { create(:user) }
  let!(:group_member) { create(:group_member, user: user, group: group) }
  let!(:todo_list) { create_list(:job_card, 4, user: user, group: group) }
  let!(:doing_list) { create_list(:job_card, 5, :doing, user: user, group: group) }
  let!(:done_list) { create_list(:job_card, 3, :done, user: user, group: group) }
  let!(:trashed_list) { create_list(:job_card, 2, :trashed, user: user, group: group) }

  before do
    allow(controller).to receive(:current_user) { user }
    allow(controller).to receive(:login?) { true }
  end

  describe '#user.my_groups' do
    it { expect(user.my_groups.size).to eq(2) } 
  end
end
