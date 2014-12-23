class CreateEmailTokens < ActiveRecord::Migration
  def change
    create_table :email_tokens do |t|
      t.string :token
      t.references :user, index: true, null: false
      t.references :group, index: true, null: false
      t.timestamps
    end
  end
end
