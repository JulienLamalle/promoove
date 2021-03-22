class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update]

  def index
    @comments = Comment.all
  end

  def def new
    @comment = Comment.new
  end
  

  def create
    @comment = Comment.new(comment_params.merge(user: current_user, project: Project.find(params[:project_id])))
    if @comment.save
      flash[:success] = "Commentaire créé!"
    else
      flash[:error] = @comment.errors.messages
    end
  end

  def edit 
  end 

  def update
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = "Commentaire édité!"
      redirect_to comments_path
    else
      flash[:error] = @comment.errors.messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user, :project)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
