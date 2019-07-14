class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @cart = CartAlbum.where(customer_id:@customer.id)
  end

  def edit
  binding.pry
    @customer = Customer.find(params[:id])
    @cart = CartAlbum.where(customer_id: params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to customer_path(customer.id)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    if customer.destroy(customer_params)
      redirect_to new_customer_registration_path 
    else
      flash[:error] = "Something went wrong"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone, :postalcode, :adress, cart_albums_attributes: [:id, :order_quantity])
  end

  def cart_album_params
    params.require(:cart_album).permit(:customer_id, :album_id, :order_quantity)
  end

end
