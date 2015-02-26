module Concerns
  module Base

    extend ActiveSupport::Concern
    include Concerns::Base::DeviseHelper

    included do
      helper_method :current_user
      helper_method :is_current_user?
    end

  end
end
