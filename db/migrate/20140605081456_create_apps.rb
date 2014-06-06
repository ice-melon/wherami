class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :app_name
      t.string :package_name
      t.string :app_description
      t.string :fingerprint
      t.string :website
      t.string :team_name
      t.integer :user_id

      t.timestamps
    end

    add_index :apps, [:app_name], unique: true
  end


end
