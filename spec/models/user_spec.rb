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

    context 'emailカラム' do
      it { expect validate_presence_of(:email) }
      it { expect ensure_length_of(:email).is_at_most(60) }
    end

    context 'providerカラム' do
      it { expect validate_presence_of(:provider) }
      it { expect ensure_length_of(:email).is_at_most(10) }
    end
  end

  describe 'twitter登録処理を追加' do
    let!(:auth) do
      { provider: 'twitter', uid: '11223344aaaa',
        info: { name: 'test user', email: 'test@gmail.com' },
        extra: { raw_info:
                 { nickname: 'hoge user', image: 'http://test.jp/tes.jpg' }
        },
        credentials: { token: '123aabbccdd', secret: 'aabb123' }
      }
    end

    context 'twitterアカウントの登録' do
      before do
        User.create_account auth
      end

      it 'ユーザが登録される' do
        test_user = User.find_by(uid: '11223344aaaa')
        expect(test_user).not_to be_nil
        expect(test_user.email).to eq('test@gmail.com')
      end
    end
  end
end
