class Friend < ActiveRecord::Base
  belongs_to :user
  delegate :name, to: :user

  def friend_user_id_list
    friend_user_ids.split(',')
  end

  def friend_users
    User.where(id: friend_user_id_list).order(id: :desc)
  end

  def become_friend(user_id)
    ids = friend_user_ids.split(',')
    ids.push(user_id)
    self.friend_user_ids = ids.join(",")
    save!
  end
end
