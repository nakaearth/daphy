class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.references :job, index: true, null: false

      t.timestamps
    end

    remove_column :job_cards, :schedule_end_date
  end
end
