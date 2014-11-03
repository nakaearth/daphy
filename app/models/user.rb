class User < ActiveRecord::Base
  belongs_to :group
  has_many :my_job_cards, class_name: JobCard

  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 60 }
  validates :provider, presence: true, length: { maximum: 10 }

  def self.create_account(auth)
    Users::Registration.new.regist auth
  end
end
