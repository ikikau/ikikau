class CustomDeviseMailer < Devise::Mailer

  protected def headers_for(action, opts)
    headers = super
    headers
  end

end
