class CommentUpvotesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @comment_upvote = CommentUpvote.new(:user_id => current_user.id, :comment_id => params[:comment_id])
    if @comment_upvote.save
      flash[:success] = "Votre like pour ce commentaire a été ajouté"
    end
  end

  def destroy
    @comment_upvote = CommentUpvote.find(params[:comment_upvote_id])
    if @comment_upvote.destroy
      flash[:success] = "Votre like pour ce commentaire a été supprimé"
    end
  end
end