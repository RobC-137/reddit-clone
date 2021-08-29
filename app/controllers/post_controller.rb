class PostController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to :root, notice: "Post was successfully created." }
        format.json { render :root, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end
  private
    def post_params
      params.require(:post).permit(:description, :title)
    end
end
