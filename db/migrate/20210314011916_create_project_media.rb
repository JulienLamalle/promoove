class CreateProjectMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :project_media do |t|
      t.belongs_to :media, index: true
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
