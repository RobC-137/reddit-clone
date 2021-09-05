# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  upvote       :boolean          not null
#  votable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#  votable_id   :integer
#
# Indexes
#
#  index_votes_on_user_id  (user_id)
#  index_votes_on_votable  (votable_type,votable_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
