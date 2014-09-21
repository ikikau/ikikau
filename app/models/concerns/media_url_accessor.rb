module Concerns
  module MediaUrlAccessor

    extend ActiveSupport::Concern

    module ClassMethods

      def attr_media_url(attr, config = {})
        define_method("#{attr}_url") do |style = nil, options = {}|
          get_media_url_for attr, config, style, options
        end
      end

    end

    def get_media_url_for(attr, config, style, options)
      assoc = send attr
      style ||= config[:default_style]

      if assoc.present?
        assoc.url style, options
      elsif config[:default_url].present?
        config[:default_url].gsub ':style', style.to_s
      else
        nil
      end
    end

  end
end
