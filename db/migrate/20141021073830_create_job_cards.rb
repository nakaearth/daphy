class CreateJobCards < ActiveRecord::Migration
  def change
    create_table :job_cards do |t|
      t.string :title
      t.string :description
      t.string :type
      t.integer :point
      t.date :schedule_end_date
      t.references :user, index: true, null: false
      t.references :group, index: true, null: false

      t.timestamps
    end
  end
end
