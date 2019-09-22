class PostsController < ApplicationController
  before_action :get_menus
  before_action :set_post, only: %i(show edit update destroy)

  # GET /posts
  # GET /posts.json
  def home
    @form_url = posts_path
    @search_url = posts_path(search: params[:search])
    @tag_urls = {}
    @posts = get_posts
    @categories = Category.post
    for category in @categories
      @tag_urls[category.name] = posts_path(category: category.name, search: params[:search])
    end
  end

  def index
    @form_url = posts_path
    @search_url = posts_path(search: params[:search])
    @tag_urls = {}
    @posts = get_posts
    @categories = Category.post
    for category in @categories
      @tag_urls[category.name] = posts_path(category: category.name, search: params[:search])
    end
  end

  # GET /posts/1
  # GET /posts/1.json

  def show
    set_meta_tags @post
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
    posts.paginate(page: params[:page], per_page: 10).order('published_at DESC')
  end
  # Use callbacks to share common setup or constraints between actions.

  def set_post
    @post = Post.find_by slug: params[:slug]
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :user_id, :thumbnail)
  end
end
