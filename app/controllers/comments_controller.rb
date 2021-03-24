class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end
  

  def create
    @comment = Comment.new(comment_params.merge(user: current_user, project: Project.find(params[:project_id])))
    if @comment.save
      respond_to do |format|
        format.html {
          flash[:success] = "Commentaire créé!"
          redirect_to project_fr_path(Comment.find(params[:project_id]))
        }
        format.js {}
      end
    end
  end

  def edit 
  end 

  def update
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = "Commentaire édité!"
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
