class PostsController < ApplicationController
  before_action :set_post, only: %i(show edit update destroy)
  before_action :require_admin, only: %i(new create edit destroy)

  # GET /posts
  # GET /posts.json
  def index
    @posts = get_posts
    @categories = Category.all
    @menus = get_menus
    # render(layout: "home")
  end

  # GET /posts/1
  # GET /posts/1.json

  def show
  end

  private

  def get_posts
    category = params[:category]
    search = params[:search]
    if category.blank? && search.blank?
      posts = Post.all
    elsif category.blank? && search.present?
      posts = Post.search(search)
    elsif category.present? && search.blank?
      posts = Post.by_category(category)
    elsif category.present? && search.present?
      posts = Post.by_category(category).search(search)
    end
    posts.paginate(page: params[:page], per_page: 6)
  end
  # Use callbacks to share common setup or constraints between actions.

  def set_post
    @post = Post.find(params[:id])
  end

  def get_menus
  [
    {
      title: "Blog",
      url: "#",
      image_url: "blog-bg.jpg",
    },
    {
      title: "About Us",
      url: "/about",
      image_url: "about-bg.jpg",
    },
    {
      title: "Team",
      url: "/team",
      image_url: "team-bg.jpg",
    },
    {
      title: "Events",
      url: "/events",
      image_url: "events-bg.jpg",
    },
    {
      title: "Gallery",
      url: "/gallery",
      image_url: "gallery-bg.jpg",
    },
    {
      title: "Donate",
      url: "/donate",
      image_url: "donate-bg.jpg",
    },
  ]
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :user_id, :thumbnail)
  end
end
