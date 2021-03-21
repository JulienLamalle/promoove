class AddColumnPictureUrlToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :picture_url, :text
  end
end
