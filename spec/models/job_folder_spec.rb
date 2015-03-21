require 'rails_helper'

RSpec.describe JobFolder, type: :model do
  describe 'validate' do
    describe 'name' do
      context 'name length > 50' do
        it { expect{JobFolder.new.save!(name: "aaaaaaaaaa" * 6)}.to raise_error }
      end
    end
  end
end
