class CreateJobFolders < ActiveRecord::Migration
  def change
    create_table :job_folders do |t|
      t.string :name, length: 50 
      t.references :group, index: true, null: true
      t.timestamps
    end
  end
end
