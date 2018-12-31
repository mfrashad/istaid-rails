class StaticPagesController < ApplicationController
  def show
    @static_page = StaticPage.find_by_slug(params[:page])
    @employees = Employee.order(:sort).all
    render params[:page].underscore.parameterize('_')
  end
end
