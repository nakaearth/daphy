class AddColumnGroupMembersOwner < ActiveRecord::Migration
  def change
    add_column :group_members, :owner, :boolean, null: true, default: false
    remove_column :users, :group_id
  end
end
