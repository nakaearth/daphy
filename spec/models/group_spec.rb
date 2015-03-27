require 'rails_helper'

describe Group, type: :model do
  describe '入力チェックをする' do
    context 'nameは必須' do
      it { expect validate_presence_of(:name) }
    end
  end
end
