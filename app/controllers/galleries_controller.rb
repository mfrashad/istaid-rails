class GalleriesController < ApplicationController
  before_action :set_gallery, only: %i(show edit update destroy)

  def index
    @galleries = Gallery.all
  end

  def show
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end
end
