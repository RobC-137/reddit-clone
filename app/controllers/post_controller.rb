class PostController < ApplicationController
  before_action :set_post, only: [ :show, :delete ]
  def index
    @posts = Post.all.preload(:user)
    @votes = Vote.where(user_id: current_user.id, votable_type: 'Post', votable: @posts) if user_signed_in?
  end

  def new
    @post = Post.new
  end

  def show
    @root_comment = Comment.roots.find_by(post_id: params[:id])
    @comments = Comment.preload(:rich_text_content, :user).descendants_of(@root_comment)
    votes = Vote.where(user_id: current_user.id, votable_type: 'Comment', votable: @comments) if user_signed_in?
    @serialized_comments = @comments.arrange_serializable do |parent, children|
      user = parent.user
      vote = votes&.find_by(votable_id: parent.id)
      {
         id: parent.id,
         children: children,
         content: parent.content,
         depth: parent.depth,
         username: user&.username.presence || '[Deleted]',
         created_at: parent.created_at,
         points: parent.points,
         voted: vote&.upvote,
      }
    end
  end

  def create
    @post = Post.new(**post_params, user: current_user)
    @post.save
    Comment.create(post_id: @post.id, user_id: current_user.id)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: "Post was successfully created." }
        format.json { render :root, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

  def delete
    @post.destroy if @post.user.id == current_user.id
    respond_to do |format|
      if @post.persisted?
        format.html { redirect_to post_index_path, notice: "Post was successfully deleted." }
      else
        format.html { redirect_to post_index_path, notice: "Post can not be deleted." }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:description, :title, :content)
    end
end
