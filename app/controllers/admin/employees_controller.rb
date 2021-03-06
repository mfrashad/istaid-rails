class Admin::EmployeesController < Admin::BaseController
  before_action :set_employee, only: %i(show edit update destroy)

  def index
    @employees = Employee.order(:sort).all.paginate(page: params[:page], per_page: 20)
  end

  def new
    @employee = Employee.new
  end

  def edit; end

  def destroy
    @employee.delete
    redirect_to admin_employees_path
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to admin_employees_url, notice: 'employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @employee.update_attributes(employee_params)
        format.html { redirect_to admin_employees_url, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :position, :image, :sort)
  end
end
