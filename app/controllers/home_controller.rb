class HomeController < ApplicationController
  def index
    render(layout: "layouts/home")
  end 
end