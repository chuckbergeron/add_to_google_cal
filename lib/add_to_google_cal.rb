require 'add_to_google_cal/version'
require 'active_record'

# require 'active_support/core_ext'
# require File.join(File.dirname(__FILE__), "add_to_google_cal/railtie")

class AddToGoogleCalBuilder

  def initialize(hash)
    @hash = hash
  end

  def call
    "https://www.google.com/calendar/render?action=TEMPLATE&dates=#{dates}"
  end

  private

    def dates
      "#{dtstart.utc.strftime('%Y%m%dT%H%M%SZ')}/#{dtend.utc.strftime('%Y%m%dT%H%M%SZ')}"
    end

    def dtstart
      @hash[:dtstart]
    end

    def dtend
      @hash[:dtend]
    end

end

# module AddToGoogleCal

#   def gcal_href
#     "https://www.google.com/calendar/render?action=TEMPLATE&dates=20190726T000000Z/20190726T000000Z&sprop=website:http://john-and-marie.craftedtoyou.com&text=John+Dylan+%26+Marie+Skye&location=New+York+City+%40+12%3A00+am&sprop=name:John+Dylan+%26+Marie+Skye&details=Any+notes%2C+descriptions%2C+links%2C+or+reminders+can+be+written+here%21Accomodations%3A+Sudden+Valley+Golf+Resort+%26+Casino%0D%0A%0D%0AGroup+Name%3A+John+Dylan+%26+Marie+Skye+Wedding%0D%0A%0D%0AGroup+Reservation+%23%3A+149602%0D%0A%0D%0ARates%3A+%24149+-+%24179%0D%0A%0D%0ACut-off+date%3A+July+30%2C+2014%0D%0A%0D%0AReservations+line%3A+1.866.555.5555%0D%0A"
#   end

#   # autoload :Hook, File.join(File.dirname(__FILE__), "add_to_google_cal/hook")
#   # autoload :InstanceMethods, File.join(File.dirname(__FILE__), "add_to_google_cal/instance_methods")

# end

# if Object.const_defined? :ActiveRecord
  # ActiveRecord::Base.send(:include, AddToGoogleCal)
# end
