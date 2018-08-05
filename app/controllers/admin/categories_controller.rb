class Admin::CategoriesController < Admin::BaseController
  before_action :get_category, only: [:edit, :update]
  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 20)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def edit
  end

  def update
    @category.update_attributes(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
