class PopulateProjectUpvotesCount < ActiveRecord::Migration[5.2]
  def change
    def up
      Project.find_each do |project|
        Project.reset_counters(project.id, :project_upvotes)
      end
    end
  end
end
