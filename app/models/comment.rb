# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  ancestry   :string
#  downvotes  :integer          default(0), not null
#  upvotes    :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_ancestry  (ancestry)
#  index_comments_on_post_id   (post_id)
#  index_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#  user_id  (user_id => users.id)
#
class Comment < ApplicationRecord
    has_ancestry
    has_rich_text :content
    belongs_to :post
    belongs_to :user
    has_many :votes, as: :votable

    def points
        upvotes - downvotes
    end
end
