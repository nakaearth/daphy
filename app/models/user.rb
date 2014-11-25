class User < ActiveRecord::Base
  has_many :group_members, dependent: :destroy
  has_many :my_groups, through: :group_members, source: :group
  has_many :my_job_cards, class_name: JobCard

  validates :name, presence: true, length: { maximum: 60 }
  validates :uid, presence: true
  validates :email, length: { maximum: 60 }
  validates :provider, presence: true, length: { maximum: 10 }

  def self.create_account(auth)
    Users::Registration.new.regist auth
  end
end
