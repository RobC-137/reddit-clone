class VotesController < ApplicationController
    before_action :find_resource, only: [:vote]
    before_action :upvoted, only: [:vote]

    def vote
        @id = vote_params["resource_id"]
        @vote = vote_params["upvote"] == 'true' ? 'upvote' : 'downvote'
        @action = CastVote.vote(@resource, @upvoted, current_user)
        @points = @resource.reload.points
        respond_to do |format|
            format.js
          end
    end

    private 
        def vote_params
            params.require(:vote).permit(:upvote, :resource_type, :resource_id)
        end

        def find_resource
            clazz = vote_params['resource_type'].camelize.constantize
            @resource = clazz.find(vote_params['resource_id'])
        end

        def upvoted
            @upvoted = vote_params['upvote'] == 'true'
        end
end
