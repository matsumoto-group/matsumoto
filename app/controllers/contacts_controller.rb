class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def confirm
		@contact = Contact.new(contact_params)

		if @contact.valid?
			render :action => 'confirm'
		else
			render :action => 'new'
		end
	end


	def create
		contact = Contact.new(contact_params)
		contact.save
		redirect_to complete_contacts_path
	end


  private
  def contact_params
    params.require(:contact).permit(:name, :name_kana, :title, :content, :email)
  end

end
