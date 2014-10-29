class User < ActiveRecord::Base
  belongs_to :group
  has_many :my_job_cards, class_name: JobCard

  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 60 }
  validates :provider, presence: true, length: { maximum: 10 }

  def self.create_account(auth)
    @login_user = User.find_or_create_by(email: auth[:info][:email]) do |user|
      user.name  = auth[:info][:name]
      user.email = auth[:info][:email]
      user.provider = auth[:provider]
      user.uid      = auth[:uid]

      unless auth[:extra].blank?
        user.nickname = auth[:extra][:raw_info][:nickname]
        user.image_url  = auth[:extra][:raw_info][:image]
      end

      unless auth[:credentials].blank?
        user.access_token = auth[:credentials][:token]
        user.secret_token = auth[:credentials][:secret]
      end
      user.group_id = 0
    end
    @login_user.save!
    @login_user
  end
end
