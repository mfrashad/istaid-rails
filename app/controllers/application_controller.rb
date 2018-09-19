class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_custom_paginate_renderer
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user, :nav_links

  def authorize
    redirect_to '/login' unless current_user
  end

  def require_admin
    redirect_to '/login' unless current_user && current_user.admin?
  end

  def get_menus
    @menus = [
      {
        title: "Buletin",
        url: "/blog",
        image_url: "blog-bg.jpg",
      },
      {
        title: "Tentang Kami",
        url: "/tentang-kami",
        image_url: "about-bg.jpg",
      },
      {
        title: "Tim Kami",
        url: "/team",
        image_url: "team-bg.jpg",
      },
      {
        title: "Kegiatan",
        url: "/events",
        image_url: "events-bg.jpg",
      },
      {
        title: "Galeri",
        url: "/galleries",
        image_url: "gallery-bg.jpg",
      },
      {
        title: "Donasi",
        url: "/donate",
        image_url: "donate-bg.jpg",
      },
    ]
  end

  def custom_paginate_renderer
    # Return nice pagination for materialize
    Class.new(WillPaginate::ActionView::LinkRenderer) do
    def container_attributes
      { class: "pagination" }
    end

    def page_number(page)
      if page == current_page
        "<li class=\"cyan active\">"+link(page, page, rel: rel_value(page))+"</li>"
      else
        "<li class=\"waves-effect\">"+link(page, page, rel: rel_value(page))+"</li>"
      end
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, "<i class=\"material-icons\">chevron_left</i>")
    end

    def next_page
      num = @collection.current_page < total_pages && @collection.current_page + 1
      previous_or_next_page(num, "<i class=\"material-icons\">chevron_right</i>")
    end

    def previous_or_next_page(page, text)
      if page
        "<li class=\"waves-effect\">"+link(text, page)+"</li>"
      else
        "<li class=\"waves-effect\">"+text+"</li>"
      end
    end
    end
  end

  def set_custom_paginate_renderer
    @custom_paginate_renderer = custom_paginate_renderer
  end
end
