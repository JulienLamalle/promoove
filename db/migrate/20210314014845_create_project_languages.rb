class CreateProjectLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :project_languages do |t|
      t.belongs_to :language
      t.belongs_to :project
      t.timestamps
    end
  end
end
