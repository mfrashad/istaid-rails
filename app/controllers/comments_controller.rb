class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted! #{@comment.errors.messages}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :post_id)
  end

  def find_commentable
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  end
end
