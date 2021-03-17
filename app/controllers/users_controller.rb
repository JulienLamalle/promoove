class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@project_competition_upvote = ProjectCompetitionUpvote.where(user: @user)
    @projects = Project.all
    #@categories = ProjectCategory.where(project_id: )
    #@project_competitions = ProjectCompetition.find()
  end
end
