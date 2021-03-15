class CreateProjectCompetitionUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :project_competition_upvotes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project_competition, index: true
      t.timestamps
    end
  end
end
