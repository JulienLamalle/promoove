class CreateProjectCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_competitions do |t|
      t.belongs_to :project, index: true
      t.belongs_to :competition, index: true
      t.integer :upvote_number
      t.timestamps
    end
  end
end
