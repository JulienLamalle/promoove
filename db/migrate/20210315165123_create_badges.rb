class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.belongs_to :badge_type, index: true
      t.belongs_to :project_competition, index: true
      t.belongs_to :badge_media, index: true
      t.timestamps
    end
  end
end
