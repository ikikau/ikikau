module Concerns
  module ResponseWithStatus

    extend ActiveSupport::Concern

    included do

      protected :response_with_status
      protected :status_for_action

    end

    def response_with_status(status = true)
      self.status = status_for_action status
    end

    def response_with_status!(status = true)
      head status_for_action(status)
    end

    def status_for_action(status)
      if status.is_a? TrueClass
        case params[:action]
        when /^create(_|$)/  then :created
        when /^destroy(_|$)/ then :no_content
        else :ok
        end
      else
        status || :unprocessable_entity
      end
    end

  end
end
