class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @project_collaborations = Collaboration.includes(:project).where(user: @user).all
    @upvotes = ProjectUpvote.includes(:project)
  end
end
