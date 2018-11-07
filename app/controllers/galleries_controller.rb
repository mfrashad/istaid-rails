class GalleriesController < ApplicationController
  before_action :set_gallery, only: %i(show edit update destroy)

  def index
    @galleries = Gallery.all.paginate(page: params[:page], per_page: 10).order('published_at DESC')
  end


  def show
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end
end
