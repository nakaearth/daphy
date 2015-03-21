require 'rails_helper'

RSpec.describe JobFolder, type: :model do
  describe 'validate' do
    describe 'name' do
      context 'presence true' do
        it { expect(JobFolder.new(name: '')).not_to be_valid }
      end

      context 'length > 50' do
        it { validate_length_of(:name).is_at_most(50) }
      end
    end
  end
end
