class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    p @customer
  end

  def edit
  end
end
