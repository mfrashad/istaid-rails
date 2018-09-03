class EventsController < ApplicationController
  before_action :set_event, only: %i(show edit update destroy)

  def index
    @events = Event.all.paginate(page: params[:page], per_page: 20)
  end

  def show; end

  private

  def set_event
    @event = Event.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def event_params
    params.require(:event).permit(:title, :summary, :body, :gallery_id, :thumbnail)
  end
end
