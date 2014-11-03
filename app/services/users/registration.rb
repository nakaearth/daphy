module Users
  class Registration
    def regist(auth)
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

      group = Group.new(name: @login_user.name + 'group')
      @login_user.group = group
      @login_user.save!

      @login_user
    end
  end
end
