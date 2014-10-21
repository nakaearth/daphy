class Group < ActiveRecord::Base
  has_many :users
  has_many :group_job_cards, class_name: :JobCard

  validates :name, presence: true, length: { maximum: 60 }
end
