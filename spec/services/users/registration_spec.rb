require 'rails_helper'

module Users
  describe Registration do
    let!(:group) { create(:group) }
    let!(:user) { create(:user) }

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

        it 'groupも登録される' do
          test_user = User.find_by(uid: '11223344aaaa')
          expect(test_user.my_groups[0].name).to eq(test_user.name + ' group')
        end
      end
    end
  end
end
