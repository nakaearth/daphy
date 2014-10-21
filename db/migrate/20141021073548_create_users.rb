class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :nickname
      t.string :access_token
      t.string :secret_token
      t.references :group, index: true, null: false

      t.timestamps
    end
  end
end
