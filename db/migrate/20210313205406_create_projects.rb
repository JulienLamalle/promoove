class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|      
      # Data
      t.string :name
      t.text :short_description
      t.text :long_description
      t.bigint :value_of_project
      t.integer :money_earned
      t.integer :number_of_developpers_on_project
      t.integer :daily_time_spent_on_project_per_developper
      t.string :link_of_github
      t.boolean :is_complete
      t.string :license
      t.boolean :is_validated

      t.timestamps
    end
  end
end
