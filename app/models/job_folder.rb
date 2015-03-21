class JobFolder < ActiveRecord::Base
  belongs_to :group
  has_many :job_cards

  validates :name, presence: true, length: { maximum: 50 }
end
