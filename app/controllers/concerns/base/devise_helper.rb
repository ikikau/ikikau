module Concerns
  module Base
    module DeviseHelper

      extend ActiveSupport::Concern

      def current_user
        current_user_account.try :user
      end

      def is_current_user?(id)
        user_account_signed_in? && current_user.id == id
      end

    end
  end
end
