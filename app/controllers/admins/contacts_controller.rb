class Admins::ContactsController < ApplicationController

  def index
  	@contacts = Contact.all
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def destroy
  	contact = Contact.find(params[:id])
  	contact.destroy
  	redirect_to admins_contacts_path
  end
end

