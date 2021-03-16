class AddDefaultOnProjectsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :is_complete, :boolean, default: false
  end
end
