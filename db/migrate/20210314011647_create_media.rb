class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :aws_link
      t.belongs_to :media_type, index: true
      t.timestamps
    end
  end
end
