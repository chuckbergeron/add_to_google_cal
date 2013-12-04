require_relative 'add_to_google_cal/builder'
require_relative 'add_to_google_cal/version'

require 'active_record'
require 'cgi'
# require 'pry-debugger'

module AddToGoogleCal

  module ClassMethods

    # Options:
    #   { summary_field: 'event_name' }
    #
    def has_google_cal(options = {})
      cattr_accessor :summary_field
      self.summary_field = (options[:summary_field] || :summary).to_s

      include AddToGoogleCal::InstanceMethods
    end

  end

  module InstanceMethods

    def to_gcal
      summary_field = self.class.summary_field
      unless self.respond_to?(summary_field)
        raise ArgumentError, "#{self} does not have a #{summary_field}"
      end
      puts self.summary

      hash = {
        dtstart: self.dtstart,
        dtend:   self.dtend,
        summary: self.send(summary_field)
      }

      AddToGoogleCal::Builder.new(hash).call
    end

  end

end

ActiveRecord::Base.send :extend, AddToGoogleCal::ClassMethods
