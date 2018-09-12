class Admin::CommentsController < Admin::BaseController
  before_action :find_commentable

  def index
    @comments = Comment.all.paginate(page: params[:page], per_page: 20)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to admin_comments_path
  end

  private

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    @commentable = Event.find_by_id(params[:event_id]) if params[:event_id]
  end
end
