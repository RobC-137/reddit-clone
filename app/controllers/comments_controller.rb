class CommentsController < ApplicationController
  def new
    @parent_id = params[:parent_id]
    respond_to do |format|
      format.js
    end
  end
  def create
    parent_comment = Comment.find(comment_params[:parent_id])
    parent_comment.children.create content: comment_params[:content], user: current_user, post_id: parent_comment.post_id
    respond_to do |format|
        format.html { redirect_to post_path(parent_comment.post_id), notice: "Post was successfully created." }
    end
  end
  
  private 
  def comment_params
    params.require(:comment).permit(:parent_id, :content)
  end
end
