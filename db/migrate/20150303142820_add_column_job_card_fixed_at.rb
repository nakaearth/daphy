class AddColumnJobCardFixedAt < ActiveRecord::Migration
  def change
    add_column :job_cards, :fixed_at, :date, null: :true
  end
end
