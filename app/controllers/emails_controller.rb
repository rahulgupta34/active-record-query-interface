require "date"
class EmailsController < ApplicationController

  def index
    @ages = Employee.where("age > 20 AND age < 40");
    @full_time_availables = Employee.where("full_time_available = 'Yes'")
    @employees = Employee.where("no_of_order = 5 AND age > 25")
    @dates = Employee.where("created_at < ?",Date.today)
    @no_of_order_five = Employee.where("no_of_order = 5 AND age < 25")
    @order_by_age = Employee.order(age: :desc)
    @order_by_no_of_order = Employee.order(no_of_order: :asc)
    @salarys = Employee.where("salary > ?",45000)
    @group_bys = Employee.select(:id,:first_name,:last_name,:no_of_order).group(:no_of_order).having("COUNT(no_of_order) >= ?",1)
    
  end

  def new
    
  end

  def create
    matchemail = Employee.find_by(email:params[:email])
    emailExist = !matchemail.nil? 
    redirect_to email_path(exist: emailExist)
    
  end

  def overriding_conditions
          @unscope_conditions = Employee.where("id > 5").order(id: :desc).select(:id,:first_name,:last_name,:age).limit(5).unscope(:where)
          @override_onlys = Employee.where("id > 5").order(id: :desc).select(:id,:first_name,:last_name,:age).limit(2).only(:where,:limit)
          @override_reselects = Employee.where("id > 5").order(id: :desc).select(:id).limit(2).reselect(:first_name,:last_name,:age,:no_of_order)
          @reorders = Employee.where("id > 2").reorder("no_of_order asc").limit(4)
          @reverse_orders = Employee.limit(6).order(first_name: :asc).reverse_order
  end

  def batches 
    @all_employess = Employee.all
  end
 
end
