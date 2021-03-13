class CreateCollaborations < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborations do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.belongs_to :role
      

      t.timestamps
    end
  end
end
