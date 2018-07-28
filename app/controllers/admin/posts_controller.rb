class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i(show edit update destroy)
  before_action :require_admin, only: %i(new create edit destroy)

  # GET /posts
  # GET /posts.json
  def index
    @posts = get_posts
    @categories = Category.all
    render(layout: "admin")
  end

  # GET /posts/1
  # GET /posts/1.json

  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit

  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
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
    posts.page(params[:page])
  end
  # Use callbacks to share common setup or constraints between actions.

  def set_post
    @post = Post.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :user_id)
  end
end