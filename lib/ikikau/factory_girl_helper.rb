module Ikikau
  module FactoryGirlHelper

    class FactoryGirlHelperProxy < BasicObject

      def initialize(method)
        @method = method
      end

      def method_missing(name, *args)
        attrs = args[0] || {}
        traits = attrs.delete(:_traits) || []

        ::FactoryGirl.send @method, name, *traits, attrs
      end

    end


  module_function

    def fg_build
      @fg_build ||= FactoryGirlHelperProxy.new :build
    end

    def fg_create
      @fg_create ||= FactoryGirlHelperProxy.new :create
    end

    def fg_attrs
      @fg_attrs ||= FactoryGirlHelperProxy.new :attributes_for
    end

  end
end
