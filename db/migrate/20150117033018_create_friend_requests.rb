class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.references :users, index: true, null: false
      t.integer :request_from_user, null: false, default: 0
      t.timestamps
    end
  end
end
