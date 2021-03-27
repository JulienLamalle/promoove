class AddColumnCounterCacheToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :project_upvotes_count, :integer, default: 0
  end
end
