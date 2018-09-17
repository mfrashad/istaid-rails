class Admin::StaticPagesController < Admin::BaseController
  before_action :get_static_page, only: [:edit, :update]
  def index
    @categories = StaticPage.all.paginate(page: params[:page], per_page: 20)
  end

  def edit; end

  def update
    @static_page.update_attributes(static_page_params)
    @static_page.save
    redirect_to admin_static_pages_path
  end

  private

  def get_static_page
    @static_page = StaticPage.find(params[:id])
  end

  def static_page_params
    params.require(:static_page).permit(:body)
  end
end
