class CommentUpvotesController < ApplicationController
  def create
    puts("##############", params)
    @comment_upvote = Comment_upvote.new(:user_id => params[:user_id], :comment_id => params[:comment_id])
  end

  def delete 
  end
end
