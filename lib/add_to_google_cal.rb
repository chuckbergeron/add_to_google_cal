require_relative 'add_to_google_cal/builder'
require_relative 'add_to_google_cal/version'

require 'active_record'
require 'cgi'
# require 'pry-debugger'

# TODO: DRY this up!
module AddToGoogleCal

  module ClassMethods

    # Options Example (in your model):
    #   has_google_cal { summary_field: 'event_name' }
    #
    def has_google_cal(options = {})
      cattr_accessor :summary_field, :dtstart_field, :dtend_field
      self.dtstart_field = (options[:dtstart_field] || :dtstart).to_s
      self.dtend_field   = (options[:dtend_field]   || :dtend).to_s
      self.summary_field = (options[:summary_field] || :summary).to_s

      include AddToGoogleCal::InstanceMethods
    end

  end

  module InstanceMethods

    def to_gcal
      dtstart_field = self.class.dtstart_field
      dtend_field   = self.class.dtend_field
      summary_field = self.class.summary_field

      unless self.respond_to?(dtstart_field)
        raise ArgumentError, "#{self} does not have a #{dtstart_field}"
      end

      unless self.respond_to?(dtend_field)
        raise ArgumentError, "#{self} does not have a #{dtend_field}"
      end

      unless self.respond_to?(summary_field)
        raise ArgumentError, "#{self} does not have a #{summary_field}"
      end

      hash = {
        dtstart: self.send(dtstart_field),
        dtend:   self.send(dtend_field),
        summary: self.send(summary_field)
      }

      AddToGoogleCal::Builder.new(hash).call
    end

  end

end

ActiveRecord::Base.send :extend, AddToGoogleCal::ClassMethods
