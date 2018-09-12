class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: %i(show edit update destroy)

  # GET /posts
  # GET /posts.json
  def index
    @events = Event.all.paginate(page: params[:page], per_page: 20)
    render(layout: "admin")
  end

  # GET /posts/1
  # GET /posts/1.json

  def show; end

  # GET /posts/new
  def new
    @event = Event.new
  end

  # GET /posts/1/edit

  def edit; end

  # POST /posts
  # POST /posts.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_url, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to admin_events_url, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def event_params
    params.require(:event).permit(:title, :summary, :body, :gallery_id, :category_id, :thumbnail)
  end
end
