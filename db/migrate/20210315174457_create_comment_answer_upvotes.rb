class CreateCommentAnswerUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_answer_upvotes do |t|
      t.belongs_to :user
      t.belongs_to :comment_answer
      t.timestamps
    end
  end
end
