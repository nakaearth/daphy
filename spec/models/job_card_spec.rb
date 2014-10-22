require 'rails_helper'

describe JobCard, type: :model do
  let!(:group) { create(:group) }
  let!(:user) { create(:user, group: group) }
  let!(:job_card) { create_list(:job_card, 4, user: user, group: group) }

  describe '幾つかのテーブルと関連を持っている' do
    context 'have a relation to user class' do
      it { expect belong_to(:users) }
    end
  end

  describe '入力チェックをする' do
    context 'titleは必須' do
      it { expect validate_presence_of(:title) }
    end
  end
end
