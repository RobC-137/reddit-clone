class PostCell < ApplicationCell
    alias post model
    def card
        render
    end

    private 
        def votes
            @votes ||= options[:votes]
        end

        def voted 
            @voted ||= votes&.find_by(votable_id: post.id)&.upvote
        end

        def upvote
            if voted
                'vote-upvote'
            else
                'vote-neutral'
            end
        end

        def downvote
            if voted == false
                'vote-downvote'
            else
                'vote-neutral'
            end
        end

        def upvote_link
            icon = "<i class='bi bi-caret-up-fill #{upvote}' id='upvote-#{post.id}'></i>"
            params = {}

            if current_user
                params.merge!({
                    remote: true,
                    method: :post,
                })
                link_to( 
                    icon, 
                    votes_vote_path({vote: {resource_type: 'post', upvote: true, resource_id: post.id}}), 
                    params  
                )
            else
                params.merge!({
                    :title => "You need to be signed in to upvote this post",
                    :data => {:toggle=>"tooltip"},
                })
                link_to( 
                    icon, 
                    'javascript:;', 
                    params  
                )

            end
        end
        
        def downvote_link
            icon = "<i class='bi bi-caret-down-fill #{downvote}' id='downvote-#{post.id}'></i>"
            params = {}

            if current_user
                params.merge!({
                    remote: true,
                    method: :post,
                })
                link_to( 
                    icon, 
                    votes_vote_path({vote: {resource_type: 'post', upvote: false, resource_id: post.id}}), 
                    params  
                )
            else
                params.merge!({
                    :title => "You need to be signed in to downvote this post",
                    :data => {:toggle=>"tooltip"},
                })
                link_to( 
                    icon, 
                    'javascript:;', 
                    params  
                )

            end
        end

end