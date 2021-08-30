# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  description :text
#  downvotes   :integer          default(0)
#  title       :string
#  upvotes     :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Post < ApplicationRecord
  has_rich_text :content
  belongs_to :user

  def points
    upvotes - downvotes
  end
end
