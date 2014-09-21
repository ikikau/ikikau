module Concerns
  module EnumerizeExtension

    extend ActiveSupport::Concern

    module ClassMethods
      def enum_options_for(attr)
        eattr = enumerized_attributes[attr]
        i18n_scope = eattr.i18n_scopes

        options = {}

        eattr.values.map do |value|
          options[I18n.t(value, scope: i18n_scope, default: value)] = value
        end

        options
      end
    end

  end
end
