module Admin
  class ApplicationController < ActionController::Base

    layout 'admin'

    before_filter :authenticate_admin_user!

    #  User
    #-----------------------------------------------
    helper_method :is_current_admin_user?

    def is_current_admin_user?(id)
      admin_user_signed_in? && current_admin_user.id == id
    end

  end
end
