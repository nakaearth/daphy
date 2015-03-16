class Group < ActiveRecord::Base
  has_many :group_job_cards, class_name: :JobCard
  has_many :group_members, dependent: :destroy
  has_many :group_member_users, through: :group_members, source: :user
  has_many :jog_folders, dependent: :destroy

  validates :name, presence: true, length: { maximum: 60 }
end
