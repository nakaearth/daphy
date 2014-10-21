class Group < ActiveRecord::Base
  has_many :users
  has_many :group_job_cards, class_name: :JobCard

  validates :name, presence: true, length: { max_length: 60 }
end
