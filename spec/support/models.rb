class Wedding < ActiveRecord::Base

  has_google_cal

end

class EventNonStandardColumns < ActiveRecord::Base

  has_google_cal :summary_field => :event_name,
                 :dtstart_field => :start_time,
                 :dtend_field   => :end_time

end
