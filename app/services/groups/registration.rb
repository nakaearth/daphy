module Groups
  class Registration
    def regist(group_params, user)
      group = Group.new(group_params)
      group.save!
      GroupMember.create!(user: user, group: group)
    end
  end
end
