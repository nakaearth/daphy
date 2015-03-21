class JobFolder < ActiveRecord::Base
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
end
