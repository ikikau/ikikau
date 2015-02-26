module Concerns
  module Gon

    extend ActiveSupport::Concern

    included do

      before_action :set_default_gon
      protected :set_default_gon

    end

    def set_default_gon
      gon.controller_name = controller_name
      gon.controller_path = controller_path
      gon.action_name = action_name
    end

  end
end
