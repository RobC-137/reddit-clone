class CommentsUpvotesDownvotesNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :upvotes, :integer, null: false, default: 0
    change_column :comments, :downvotes, :integer, null: false, default: 0
  end
end
