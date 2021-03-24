class AddColumnPictureUrlToLanguages < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :picture_url, :text
  end
end
