class Admin::GalleryImagesController < Admin::BaseController
  # truncated for brevity.

  def index
    @gallery = Gallery.find_by_slug(params[:gallery_slug])
    @gallery_images = @gallery.gallery_images
  end

  def create
    @gallery = Gallery.find_by_slug(params[:gallery_slug])
    @gallery_image = @gallery.gallery_images.create(gallery_image_params)
    @gallery_image.save
  end

  def destroy
    @gallery = Gallery.find_by_slug(params[:gallery_slug])
    @gallery_image = GalleryImage.find(params[:id])
    @gallery_image.delete
    redirect_to admin_gallery_gallery_images_path(@gallery)
  end

  private

  def gallery_image_params
    params.require(:gallery_image).permit(:image, :caption)
  end
end
