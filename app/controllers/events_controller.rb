class EventsController < ApplicationController
  before_action :set_event, only: %i(show edit update destroy)

  def index
    @events = get_events
    @categories = Category.event
  end

  def show; end

  private

  def get_events(category=params[:category], search=params[:search])
    if category.blank? && search.blank?
      events = Event.all
    elsif category.blank? && search.present?
      events = Event.search(search)
    elsif category.present? && search.blank?
      events = Event.by_category(category)
    elsif category.present? && search.present?
      events = Event.by_category(category).search(search)
    end
    events.paginate(page: params[:page], per_page: 10)
  end

  def set_event
    @event = Event.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def event_params
    params.require(:event).permit(:title, :summary, :body, :gallery_id, :thumbnail)
  end
end
