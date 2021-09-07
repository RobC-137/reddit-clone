class CommentCell < ApplicationCell
    alias comment model

    private 
        def id
            comment[:id]
        end

        def children
            comment[:children]
        end

        def content
            comment[:content]
        end

        def depth
            comment[:depth]
        end

        def username
            comment[:username]
        end

        def created_at
            comment[:created_at]
        end

        def points
            comment[:points]
        end

        def voted
            @voted ||= comment[:voted] 
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

        def reply_link
            params = {
                style: 'font-size: small', 
                id: "reply-link-comment-#{id}",
            }
            text = 'Reply'
            if current_user
                params.merge!({
                    :onclick => 'disableLink(this)',
                    remote: true, 
                })
                link_to 'Reply', {controller: "comments", action: "new", parent_id: id}, params
            else
                params.merge!({
                    :title => "You need to be signed in to reply to this comment",
                    :data => {:toggle=>"tooltip"},
                })
                link_to text, 'javascript:;', params
            end
        end

        def upvote_link
            icon = "<i class='bi bi-caret-up-fill #{upvote}' id='upvote-#{id}'></i>"
            params = {}

            if current_user
                params.merge!({
                    remote: true,
                     method: :post,
                })
                link_to( 
                    icon, 
                    votes_vote_path({vote: {resource_type: 'comment', upvote: true, resource_id: id}}), 
                    params  
                )
            else
                params.merge!({
                    :title => "You need to be signed in to upvote this comment",
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
            icon = "<i class='bi bi-caret-down-fill #{downvote}' id='downvote-#{id}'></i>"
            params = {}
    
            if current_user
                params.merge!({
                    remote: true,
                     method: :post,
                })
                link_to( 
                    icon, 
                    votes_vote_path({vote: {resource_type: 'comment', upvote: false, resource_id: id}}), 
                    params  
                )
            else
                params.merge!({
                    :title => "You need to be signed in to downvote this comment",
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