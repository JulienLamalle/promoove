class CreateBadgeMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_media do |t|
      t.string :aws_link
      t.timestamps
    end
  end
end
