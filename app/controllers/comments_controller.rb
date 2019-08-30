class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    if verify_recaptcha(model: @comment) && @comment.save
      redirect_back(fallback_location: root_path, notice: 'Your comment was successfully posted!')
    else
      redirect_back(fallback_location: root_path, notice: "Your comment wasn't posted! #{@comment.errors.messages}")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :post_id)
  end

  def find_commentable
    @commentable = Post.find_by_slug(params[:post_slug]) if params[:post_slug]
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Event.find_by_slug(params[:event_slug]) if params[:event_slug]
  end
end
