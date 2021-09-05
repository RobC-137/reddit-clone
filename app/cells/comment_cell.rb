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
end