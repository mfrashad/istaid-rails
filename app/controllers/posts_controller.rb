class PostsController < ApplicationController
  before_action :get_menus
  before_action :set_post, only: %i(show edit update destroy)

  # GET /posts
  # GET /posts.json
  def home
    @posts = get_posts
    @categories = Category.post
  end

  def index
    @posts = get_posts
    @categories = Category.post
  end

  # GET /posts/1
  # GET /posts/1.json

  def show
  end

  private

  def get_posts(category=params[:category], search=params[:search])
    if category.blank? && search.blank?
      posts = Post.all
    elsif category.blank? && search.present?
      posts = Post.search(search)
    elsif category.present? && search.blank?
      posts = Post.by_category(category)
    elsif category.present? && search.present?
      posts = Post.by_category(category).search(search)
    end
    posts.paginate(page: params[:page], per_page: 10).order('updated_at DESC')
  end
  # Use callbacks to share common setup or constraints between actions.

  def set_post
    @post = Post.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :user_id, :thumbnail)
  end
end
