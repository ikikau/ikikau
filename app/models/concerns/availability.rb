module Concerns
  module Availability

    extend ActiveSupport::Concern

    included do

      private :time_to_seconds


      #  Scopes
      #-----------------------------------------------
      scope :weekday_available, ->(t = Time.zone.now) {
        where("`#{self.to_s.tableize}`.`weekday` & ? != 0", 1 << t.wday)
      }

      scope :time_available, ->(t = Time.zone.now) {
        time = t.strftime '%H:%M:%S'

        where(arel_table[:start_at].lteq(time))
        where(arel_table[:end_at].gteq(time))
      }

      scope :available, ->(t = Time.zone.now) {
        weekday_available(t).time_available(t)
      }


      #  Accessors
      #-----------------------------------------------
      %w[
        sunday
        monday
        tuesday
        wednesday
        thursday
        friday
        saturday
      ].each.with_index do |wday, i|

        ###
        # Return true if `weekday` has a flag of `wday`
        #
        # @return {Boolean}
        ###
        define_method wday do
          self.weekday & (1 << i) != 0
        end

        ###
        # Setter for `wday`
        #
        # @params {Boolean}
        #
        # @return {Boolean}
        ###
        define_method "#{wday}=" do |flag|
          if %w[1 true].include? flag.to_s
            self.weekday |= 1 << i
            true
          else
            self.weekday &= ~(1 << i)
            false
          end
        end
      end

    end

    ###
    # Check if `weekday` has a flag of `time`'s weekday
    #
    # @params {Time} time
    #
    # @return {Boolean}
    ###
    def weekday_available?(time = Time.zone.now)
      self.weekday & (1 << time.wday) != 0
    end

    ###
    # Check if time is within a bounds of start_at and end_at
    #
    # @params {Time} time
    #
    # @return {Boolean}
    ###
    def time_available?(time = Time.zone.now)
      t = time_to_seconds time
      time_to_seconds(self.start_at) <= t && time_to_seconds(self.end_at) >= t
    end

    ###
    # Check both weekday and time bounds
    #
    # @params {Time} time
    #
    # @return {Boolean}
    ###
    def available?(time = Time.zone.now)
      weekday_available?(time) && time_available?(time)
    end

    ###
    # Time object to a value of stacked secounds
    #
    # @params {Time} t
    #
    # @return {Integer}
    ###
    def time_to_seconds(t)
      ((t.hour * 60) + t.min) * 60 + t.sec
    end

  end
end
