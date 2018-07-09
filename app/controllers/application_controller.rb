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

  def nav_links
    [
      { label: 'Home', key: 'home', href: '/posts' },
      { label: 'Categories', key: 'blog', href: '/blog', has_children: true, children: Category.all },
      { label: 'Gallery', key: 'gallery', href: '/gallery'},
      { label: 'Contact', key: 'contact', href: '/contact' },
    ]
  end
end
