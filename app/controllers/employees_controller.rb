class EmployeesController < ApplicationController
  def index
    @employees = Employee.all.order("id desc").limit(10);
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
     @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_initialize_by(employee_params)
    if @employee.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name,:last_name,:age,:email,:no_of_order,:full_time_available,:salary)
    end

end
