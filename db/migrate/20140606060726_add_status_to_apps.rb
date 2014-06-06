class AddStatusToApps < ActiveRecord::Migration
  def change
    add_column :apps, :status, :boolean, default: false
  end
end
