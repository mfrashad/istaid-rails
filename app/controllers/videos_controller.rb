class VideosController < ApplicationController
  def index
    @videos = Video.all.paginate(page: params[:page], per_page: 20).order("published_at DESC")
  end

  def show
    @video = Video.find_by slug: params[:slug]
  end
end
