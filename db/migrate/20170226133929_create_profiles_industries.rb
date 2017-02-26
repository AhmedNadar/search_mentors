class CreateProfilesIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :industries_profiles do |t|
      t.integer :profile_id,  null: false, index: true
      t.integer :industry_id,    null: false, index: true
    end
  end
end
