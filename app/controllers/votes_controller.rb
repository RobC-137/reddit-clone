class VotesController < ApplicationController
    def vote
        @id = vote_params["resource_id"]
        @vote = vote_params["upvote"] == 'true' ? 'upvote' : 'downvote'
        @action = CastVote.vote(vote_params, current_user)
        respond_to do |format|
            format.js
          end
    end

    private 
        def vote_params
            params.require(:vote).permit(:upvote, :resource_type, :resource_id)
        end
end
