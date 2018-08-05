class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
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
        url: "/about",
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
end
