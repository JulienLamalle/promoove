class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @project_collaborations = Collaboration.includes(:project, :role).where(user: @user)

    @all_collaboration_projects = Array.new
    @project_collaborations.each do |collaboration| 
      @project_data = {
        project: collaboration.project,
        role: collaboration.role,
        upvotes: ProjectUpvote.includes(:user).where(project: collaboration.project),
        categories: ProjectCategory.includes(:category).where(project: collaboration.project)
      }
      @all_collaboration_projects << @project_data
    end
  end
end
