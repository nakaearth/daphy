require 'rails_helper'

describe User, type: :model do
  let!(:group) { create(:group) }
  let!(:user) { create(:user, group: group) }

  describe '幾つかのテーブルと関連を持っている' do
    context 'have a relation to user class' do
      it { expect belong_to(:groups) }
    end
  end

  describe '入力チェックをする' do
    context 'nameカラム' do
      it { expect validate_presence_of(:name) }
      it { expect ensure_length_of(:name).is_at_most(60) }
    end

    context 'uidカラム' do
      it { expect validate_presence_of(:uid) }
    end

    context 'emailカラム' do
      it { expect ensure_length_of(:email).is_at_most(60) }
    end

    context 'providerカラム' do
      it { expect validate_presence_of(:provider) }
      it { expect ensure_length_of(:email).is_at_most(10) }
    end
  end
end
