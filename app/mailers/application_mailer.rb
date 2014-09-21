class ApplicationMailer < ActionMailer::Base

  extend ApplicationHelper

  layout 'email'

  default from: Rails.application.secrets.account_mail['address']

end
