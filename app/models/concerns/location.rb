require 'digest'


module Concerns
  module Location

    extend ActiveSupport::Concern

    included do

      #  Validations
      #-----------------------------------------------
      validates :prefecture,
        presence: true,
        inclusion: { in: 1..47 }

      validates :address_1, presence: true

      validates :postal_code,
        postal_code: true,
        if: ->(location) { location.has_attribute? :postal_code }

      # with_options if: ->(location) { location.has_attribute? :latitude } do |location|
      #   location.validates :latitude,
      #     presence: true,
      #     numericality: {
      #       greater_than_or_equal_to: -90.0,
      #       less_than_or_equal_to:    +90.0,
      #     }
      #   location.validates :longitude,
      #     presence: true,
      #     numericality: {
      #       greater_than_or_equal_to: -180.0,
      #       less_than_or_equal_to:    +180.0,
      #     }
      # end

      # validates :address_code,
      #   if: ->(location) { location.has_attribute? :address_code_size },
      #   presence: true,
      #   format: { with: /\A([0-9a-f]{8}-?){1,7}\z/ }


      #  Callbacks
      #-----------------------------------------------
      before_save do |location|
        next unless location.prefecture_changed? || location.address_1_changed?

        geo = Geocoder.search "#{location.prefecture_name} #{location.address_1}"

        if (geo = geo[0])
          if location.has_attribute? :latitude
            location.latitude, location.longitude = geo.coordinates
          end

          if self.has_attribute? :address_code_size
            self.address_codes = Ikikau::AddressCode.from_geo geo
          end
        elsif Rails.env.development?
          # fallback: set dummy instead
          # 1 Chome-2 Shibuya, Shibuya-ku, Tokyo-to, Japan
          if location.has_attribute? :latitude
            location.latitude, location.longitude = 35.66149130, 139.70640600
          end

          location.address_codes = %w[
            53a577bb
            cd70024a
            0ec835d8
            2b1e51d2
            1c6659fa
            c81e728d
          ]
        else
          # fail with validation error
          location.errors.add :address_1, I18n.t('errors.custom.not_found')
          false
        end
      end

    end

    ###
    # List of prefectures useful for select_box options
    #
    # @return {Hash<String, Integer>}
    ###
    module_function def prefectures
      @@prefectures ||= I18n.t('prefecture').invert
    end

    ###
    # Internationalized name for prefecture
    #
    # @return {String}
    ###
    def prefecture_name
      I18n.t('prefecture')[self.prefecture.to_i] || ''
    end

    ###
    # Concatenate prefecture and splitted adresses
    #
    # @return {String}
    ###
    def full_address
      [prefecture_name, address_1, address_2].join
    end

    ###
    # GoogleMap URL for the location
    #
    # @params {Symbol} type - one of :web, :app
    #
    # @return {String}
    ###
    def google_map_url(type = :web)
      scheme = case type
        when :web then 'https://maps.google.com/maps?ll=%.8f,%.8f&q=%s'
        when :app then 'comgooglemaps://?ll=%.8f,%.8f&q=%s'
        else ''
        end

      scheme % [self.latitude, self.longitude, URI::escape(self.full_address)]
    end

    ###
    # Setter for address codes
    #
    # @params {Array<String>} codes
    #
    # @return {Array<String>}
    ###
    def address_codes=(codes)
      return [] unless self.has_attribute? :address_code_size

      @address_codes = (1..Ikikau::AddressCode::MAX_COMPONENT_SIZE)
        .map { |i| self.send "address_code_#{i}=", codes[i - 1] || '' }
        .reject(&:blank?)
        .freeze

      self.address_code_size = @address_codes.size

      @address_codes
    end

    ###
    # Getter for address codes
    #
    # @return {Array<String>}
    ###
    def address_codes
      return [] unless self.has_attribute? :address_code_size

      @address_codes ||= (1..Ikikau::AddressCode::MAX_COMPONENT_SIZE)
        .map { |i| self.send "address_code_#{i}" }
        .reject(&:blank?)
        .freeze
    end

    ###
    # Getter for address code (dash-joint id)
    #
    # @return {String}
    ###
    def address_code
      address_codes.join '-'
    end

  end
end
