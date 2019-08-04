class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@customers = Customer.where(deleted: nil)
    @deleted_customers = Customer.where(deleted: true)
  end

  def show
  	@customer = Customer.find(params[:id])
  	@cart = CartAlbum.where(customer_id:@customer.id)
    @order = Order.where(customer_id: @customer.id)

  end

  def edit
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: params[:id])
  end

  def update
     customer = Customer.find(params[:id])
     customer.update(customer_params)
     redirect_to admins_customer_path(params[:id])
  end

  def delete
    customer = Customer.find(params[:id])
    customer.update(deleted: true)
    redirect_to admins_customers_path
  end


  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone, :postalcode, :adress)
  end
end
