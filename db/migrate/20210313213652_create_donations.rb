class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      # Links
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true

      # Data
      t.bigint :amount

      t.timestamps
    end
  end
end
