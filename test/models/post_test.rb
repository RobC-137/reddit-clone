# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  description :text
#  downvotes   :integer
#  title       :string
#  upvotes     :integer
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
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
