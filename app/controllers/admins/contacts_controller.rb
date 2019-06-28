class Admins::ContactsController < ApplicationController

  def index
  	@contacts = Contact.all
  end

  def show
  end
end
