class Admin::GalleriesController < Admin::BaseController
  before_action :set_gallery, only: %i(show edit update destroy)

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.delete
    redirect_to admin_galleries_path
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:notice] = "Your gallery has been created."
      redirect_to admin_galleries_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def update
    @gallery.update(gallery_params)
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
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description)
  end
end
