class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :user, index: true, null: false
      t.string :friend_user_ids, null: true

      t.timestamps
    end
  end
end
