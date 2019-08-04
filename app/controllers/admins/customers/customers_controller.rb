class Admins::Customers::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @Customers = Customer.all
  end

  def show  
    @customer = Customer.find(params[:id])
    
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.update(customer_params)
    if customer.save
      redirect_to root_path
    else
      render 'admins/customers/edit'
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    if customer.destroy(customer_params)
      redirect_to root_path
    else
      render 'admins/customer/edit'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone, :postalcode, :adress)
  end

end
