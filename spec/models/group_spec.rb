require 'rails_helper'

describe Group, type: :model do
  describe '幾つかのテーブルと関連を持っている' do
    context 'have a relation to user class' do
      it { expect have_many(:job_forlders) }
    end
  end

  describe '入力チェックをする' do
    context 'nameは必須' do
      it { expect validate_presence_of(:name) }
    end
  end
end
