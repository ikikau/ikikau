class ApplicationController < ActionController::Base

  protect_from_forgery


  #  Devise
  #-----------------------------------------------
  def after_sign_in_path_for(resource)
    case resource
    when AdminUser then admin_root_path
    else root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when AdminUser then admin_root_path
    else root_path
    end
  end

end
