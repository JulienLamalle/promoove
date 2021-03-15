class CreateCommentAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_answers do |t|
      t.text :content
      t.belongs_to :user
      t.belongs_to :comment
      t.timestamps
    end
  end
end
