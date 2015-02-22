require 'digest'

module Ikikau
  module AddressCode

    HASH_PARTIAL       = 0...8
    MAX_COMPONENT_SIZE = 8

    class << self

      ###
      # Generate ID from geocoding results
      #
      # @params {Geocoder::Result::Google} geo
      #
      # @return {Array<String>}
      ###
      def from_geo(geo)
        regulate(geo.address_components).map { |c| hash c['long_name'] }
      end

      ###
      # Reguale address components to be hashed
      #
      # @params {Array<Hash<String, Object>>} components
      #
      # @return {Array<Hash<String, Object>>}
      #
      # @see https://developers.google.com/maps/documentation/geocoding/#Types
      ###
      def regulate(components)
        components
        .select { |c| c['types'].include? 'political' }
        .reverse
        .first MAX_COMPONENT_SIZE
      end

      ###
      # Sanitize array of codes
      #
      # @params {Array<Object>} codes
      #
      # @return {Array<String>}
      ###
      def sanitize_array(codes)
        codes.first(MAX_COMPONENT_SIZE).map { |code| sanitize code }
      end

      ###
      # Sanitize code string
      #
      # @params {String} code
      #
      # @return {String}
      ###
      def sanitize(code)
        code.to_s.gsub(/[^0-9a-f]/, '')[HASH_PARTIAL]
      end

      ###
      # Component hash
      #
      # @params {String} str
      #
      # @return {String}
      ###
      private def hash(str)
        Digest::MD5.hexdigest(str)[HASH_PARTIAL]
      end

    end
  end
end
