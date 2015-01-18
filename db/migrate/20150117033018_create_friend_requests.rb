class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_request_registrations do |t|
      t.references :user, index: true, null: false
      t.integer :request_from_user, null: false, default: 0
      t.timestamps
    end
  end
end
