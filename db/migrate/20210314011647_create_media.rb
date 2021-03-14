class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :data_type
      t.string :aws_link

      t.timestamps
    end
  end
end
