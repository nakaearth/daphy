class Friend < ActiveRecord::Base
  belongs_to :user

  def friend_users
    User.where(id: friend_user_ids.split(',')).order(id: :desc)
  end

  def become_friend(user_id)
    ids = self.friend_user_ids.split(',')
    ids.push(user_id)
    self.friend_user_ids = ids.join(",")
    save!
  end
end
