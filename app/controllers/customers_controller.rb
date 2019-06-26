class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    p customer
    if customer.update(customer_params)
      redirect_to customer_path(customer.id)

    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end


  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone, :postalcode, :adress)
  end
end
