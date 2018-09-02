class EmployeesController < ApplicationController
  def index
    @employees = Employee.order(:sort).all.paginate(page: params[:page], per_page: 20)
  end
end
