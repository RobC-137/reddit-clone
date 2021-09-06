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
end