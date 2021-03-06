class EventsController < ApplicationController
  before_action :set_event, only: %i(show edit update destroy)

  def index
    @form_url = events_path
    @search_url = events_path(search: params[:search])
    @tag_urls = {}
    @events = get_events
    @categories = Category.event
    for category in @categories
      @tag_urls[category.name] = events_path(category: category.name, search: params[:search])
    end
  end

  def show
    set_meta_tags @event
  end

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
    events.paginate(page: params[:page], per_page: 10).order('published_at DESC')
  end

  def set_event
    @event = Event.find_by slug: params[:slug]
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def event_params
    params.require(:event).permit(:title, :summary, :body, :gallery_id, :thumbnail)
  end
end
