class Admin::Base < ApplicationController
    admins 'albums'
    admins 'contacts'
    admins 'customers'
    admins 'customers/orders'

end