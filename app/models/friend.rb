class Friend < ActiveRecord::Base
  belongs_to :user

  def friend_users
    User.where(id: friend_user_ids.split(',')).order(id: :desc)
  end
end
