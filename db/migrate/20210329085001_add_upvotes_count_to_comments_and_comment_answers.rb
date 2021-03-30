class AddUpvotesCountToCommentsAndCommentAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :upvotes_count, :integer, default: 0
    add_column :comment_answers, :upvotes_count, :integer, default: 0
  end
end
