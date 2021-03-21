class AddVideoLinkColumnToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :video_link, :string
  end
end
