class Admin::GalleriesController < Admin::BaseController
  before_action :set_gallery, only: %i(show edit update destroy)

  def index
    @galleries = Gallery.all.order("published_at DESC").paginate(page: params[:page], per_page: 20)
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def destroy
    @gallery.delete
    redirect_to admin_galleries_path
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.slug = @gallery.title.parameterize
    if @gallery.save
      flash[:notice] = "Your gallery has been created."
      redirect_to admin_galleries_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def update
    @gallery.assign_attributes(gallery_params)
    @gallery.slug = gallery.title.parameterize
    if @gallery.save
      flash[:notice] = "Your gallery has been created."
      redirect_to admin_galleries_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def set_gallery
    @gallery = Gallery.find_by slug: params[:slug]
  end

  def gallery_params
    params.require(:gallery).permit(:title, :published_at, :description)
  end
end
