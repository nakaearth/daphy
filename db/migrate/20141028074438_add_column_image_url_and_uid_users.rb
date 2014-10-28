class AddColumnImageUrlAndUidUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string, after: :email
    add_column :users, :uid, :string, null: false, default: '' , after: :nickname
    add_index :users, [:provider, :email]
  end
end
