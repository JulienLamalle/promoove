namespace :counters do
  task update: :environment do
    Project.find_each do |project|
      Project.reset_counters(project.id, :project_upvotes)
    end
  end
end
