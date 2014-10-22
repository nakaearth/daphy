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
    context 'nameは必須' do
      it { expect validate_presence_of(:name) }
    end

    context 'emailは必須' do
      it { expect validate_presence_of(:email) }
    end

    context 'providerは必須' do
      it { expect validate_presence_of(:provider) }
    end

    context 'access_tokenは必須' do
      it { expect validate_presence_of(:access_token) }
    end

    context 'secret_tokenは必須' do
      it { expect validate_presence_of(:secret_token) }
    end
  end
end
