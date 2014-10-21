class User < ActiveRecord::Base
  belongs_to :group
  has_many :my_job_cards, class_name: JobCard

  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 60 }
  validates :provider, presence: true, length: { maximum: 10 }
  validates :access_token, presence: true
  validates :secret_token, presence: true
end
