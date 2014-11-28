module Users
  class Registration
    def regist(auth)
      ActiveRecord::Base.transaction do
        @login_user = User.find_or_create_by(name: auth[:info][:name]) do |user|
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
        end
        @login_user.save!

        # TODO: ここはコールバックにしたほうがいいのか?
        # group = Group.find_or_create_by(name: @login_user.name + ' group')
        # GroupMember.find_or_create_by(user: @login_user, group: group)
        @login_user
      end
    end
  end
end
