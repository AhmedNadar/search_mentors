class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name,   index: true
      t.string :last_name,    index: true
      t.string :company,      index: true
      t.text   :summery,      index: true
      t.string :city,         index: true
      t.string :country,      index: true
      t.string :gender,       index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
