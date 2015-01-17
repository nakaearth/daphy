class FriendPolicy < ApplicationPolicy
  def destroy?
    record.user == user
  end
end
