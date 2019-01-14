class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: %i(show edit update destroy)

  # GET /posts
  # GET /posts.json
  def index
    @videos = Video.all.order("published_at DESC").paginate(page: params[:page], per_page: 20)
    render(layout: "admin")
  end

  # GET /posts/1
  # GET /posts/1.json

  def show
  end

  # GET /posts/new
  def new
    @video = Video.new
  end

  # GET /posts/1/edit

  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @video = Video.new(video_params)
    @video.youtube_id = youtube_id(@video.youtube_url)
    @video.thumbnail = "https://img.youtube.com/vi/"+@video.youtube_id+"/hqdefault.jpg"
    respond_to do |format|
      if @video.save
        format.html { redirect_to admin_videos_url, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      params[:video][:youtube_id] = youtube_id(params[:video][:youtube_url])
      params[:video][:thumbnail] = "https://img.youtube.com/vi/"+params[:video][:youtube_id]+"/hqdefault.jpg"
      if @video.update_attributes(video_params)
        format.html { redirect_to admin_videos_url, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to admin_videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


  def youtube_id(youtube_url)
    regex = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/
    match = regex.match(youtube_url)
    if match && !match[1].blank?
      match[1]
    else
      nil
    end
  end
  # Use callbacks to share common setup or constraints between actions.

  def set_video
    @video = Video.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def video_params
    params.require(:video).permit(:title, :body, :user_id, :published_at, :thumbnail, :youtube_url, :youtube_id)
  end
end
