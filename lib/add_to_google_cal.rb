require_relative 'add_to_google_cal/version'
require_relative 'add_to_google_cal/builder'

require 'active_record'
require 'cgi'
# require 'debugger'

module AddToGoogleCal

  def to_gcal
    # TODO: Replace this with a way of configuring the columns, and values from the model:
    hash = {
      dtstart: self.dtstart,
      dtend:   self.dtend,
      summary: self.summary
    }

    AddToGoogleCal::Builder.new(hash).call
  end

end

ActiveRecord::Base.send :include, AddToGoogleCal
