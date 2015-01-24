class FriendRequestRegistration < ActiveRecord::Base
  belongs_to :user
  delegate :name, to: :user
  delegate :image_url, to: :user
end
