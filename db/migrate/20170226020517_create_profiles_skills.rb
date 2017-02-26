class CreateProfilesSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles_skills do |t|
      t.integer :profile_id,  null: false, index: true
      t.integer :skill_id,    null: false, index: true
    end
  end
end
