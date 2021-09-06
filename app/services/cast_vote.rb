class CastVote
    def self.vote params, current_user
        clazz = params['resource_type'].camelize.constantize
        resource = clazz.find(params['resource_id'])
        upvoted = params['upvote'] == 'true'
        voted = Vote.find_by(votable: resource, user_id: current_user.id)

        if voted.nil?
            Vote.create upvote: upvoted, votable: resource, user_id: current_user.id
            upvoted ? :upvote : :downvote
        elsif voted.upvote? == upvoted
            voted.destroy!
            :neutral
        elsif 
            voted.update(upvote: upvoted)
            upvoted ? :upvote : :downvote
        end
    end
end