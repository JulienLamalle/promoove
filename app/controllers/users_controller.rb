class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @project_collaborations = Collaboration.includes(:project).where(user: @user)

    @all_collaboration_projects = Array.new
    @project_collaborations.each do |collaboration| 
      @project_data = Hash.new
      @project_data[:testeur] = "works"
      @project_data[:project] = collaboration.project
      @project_data[:role] = collaboration.role
      @project_data[:upvotes] = ProjectUpvote.where(project: collaboration.project).size
      @project_data[:categories] = ProjectCategory.includes(:category).where(project: collaboration.project)
      @all_collaboration_projects << @project_data
    end
    puts "------------------------------"
    pp @all_collaboration_projects << @project_data
    puts "*****************************"
  end
end
