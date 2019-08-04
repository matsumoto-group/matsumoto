class Admins::Customers::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def update
    params.permit!
    params['order'].keys.each do |id|
      @order = Order.find(id.to_i)
      @order.update_attributes(params['order'][id])
    end
    redirect_to admins_customer_path(@order.customer)
		
	end


  def destroy
  end

  def order_params
    params.require(:order).permit( :first_name, :last_name, :postalcode, :order_adress, :payway, :order_status, order_albums_attributes: [:id, :order_id, :album_name, :jacket_image, :price, :stock_quantity, :genre, :label])
  end


end
