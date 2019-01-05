class VideosController < ApplicationController
  def index
    @videos = Video.all.paginate(page: params[:page], per_page: 20)
  end

  def show
    @video = Video.find(params[:id])
  end
end
