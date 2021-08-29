class PostUpvoteDownvoteChangeDefaultValues < ActiveRecord::Migration[6.1]
  def up
    change_column_default :posts, :upvotes, 0
    change_column_default :posts, :downvotes, 0
  end

  def down
    change_column_default :posts, :upvotes, nil
    change_column_default :posts, :downvotes, nil
  end
end
