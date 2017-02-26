class CreateProfilesJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs_profiles do |t|
      t.integer :profile_id,  null: false, index: true
      t.integer :job_id,      null: false, index: true
    end
  end
end
