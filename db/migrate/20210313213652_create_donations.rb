class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      # Links
      t.belongs_to :user
      t.belongs_to :project

      # Data
      t.bigint :amount

      t.timestamps
    end
  end
end
