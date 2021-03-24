class CommentAnswersController < ApplicationController
  before_action :set_comment, only: [:edit, :update]

  def index
    @comment_answers = CommentAnswer.all
  end

  def def new
    @comment_answer = CommentAnswer.new
  end
  

  def create
    @comment_answer = CommentAnswer.new(comment_answer_params.merge(user: current_user, comment: Comment.find(params[:comment_id])))
    if @comment_answer.save
      flash[:success] = "Commentaire créé!"
    else
      flash[:error] = @comment_answer.errors.messages
    end
  end

  def edit 
  end 

  def update
    @comment_answer.update(comment_answer_params)
    if @comment_answer.save
      flash[:success] = "Commentaire édité!"
    else
      flash[:error] = @comment_answer.errors.messages
    end
  end

  private

  def comment_answer_params
    params.require(:comment_answer).permit(:content, :user, :comment)
  end

  def set_comment
    @comment_answer = CommentAnswer.find(params[:id])
  end
end
