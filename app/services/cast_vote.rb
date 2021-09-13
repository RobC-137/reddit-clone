class CastVote
    def self.vote resource, upvoted, current_user
        voted = Vote.find_by(votable: resource, user_id: current_user.id)

        if voted.nil?
            Vote.create upvote: upvoted, votable: resource, user_id: current_user.id
            if upvoted
                upvotes = resource.upvotes + 1
                resource.update(upvotes: upvotes)
                :upvote
            else
                downvotes = resource.downvotes + 1
                resource.update(downvotes: downvotes)
                :downvote
            end
        elsif voted.upvote? == upvoted
            if upvoted
                upvotes = resource.upvotes - 1
                resource.update(upvotes: upvotes)
            else
                downvotes = resource.downvotes - 1
                resource.update(downvotes: downvotes)
            end
            voted.destroy!
            :neutral
        elsif 
            if upvoted
                upvotes = resource.upvotes + 1
                downvotes = resource.downvotes - 1
                resource.update(upvotes: upvotes)
                resource.update(downvotes: downvotes)
            else
                upvotes = resource.upvotes - 1
                downvotes = resource.downvotes + 1
                resource.update(upvotes: upvotes)
                resource.update(downvotes: downvotes)
            end
            voted.update(upvote: upvoted)
            upvoted ? :upvote : :downvote
        end
    end
end