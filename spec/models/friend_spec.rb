require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe '幾つかのテーブルと関連を持っている' do
    it { expect belong_to(:users) }
  end
end
