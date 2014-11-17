module Users
  class Registration
    def regist(auth)
      ActiveRecord::Base.transaction do
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
          user.group = Group.find_or_create_by(name: user.name + ' group')
        end
        @login_user.save!
        @login_user
      end
    end
  end
end
