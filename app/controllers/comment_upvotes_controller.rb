class CommentUpvotesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @comment_upvote = CommentUpvote.new(:user_id => current_user.id, :comment_id => params[:comment_id])
    if @comment_upvote.save
      flash[:success] = "Votre vote pour ce commentaire a été ajouté"
      redirect_to project_path(@project)
    end
  end

  def delete 
  end
end
