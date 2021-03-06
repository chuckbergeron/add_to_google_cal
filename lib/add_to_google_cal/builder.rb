module AddToGoogleCal

  class Builder

    attr_accessor :hash

    def initialize(object_or_hash)
      self.hash = object_or_hash
      validate!
    end

    # Output Examples:
    #
    # https://www.google.com/calendar/render?action=TEMPLATE&dates=20190726T000000Z/20190726T000000Z&sprop=website:http://john-and-marie.craftedtoyou.com&text=John+Dylan+%26+Marie+Skye&location=New+York+City+%40+12%3A00+am&sprop=name:John+Dylan+%26+Marie+Skye&details=Any+notes%2C+descriptions%2C+links%2C+or+reminders+can+be+written+here%21Accomodations%3A+Sudden+Valley+Golf+Resort+%26+Casino%0D%0A%0D%0AGroup+Name%3A+John+Dylan+%26+Marie+Skye+Wedding%0D%0A%0D%0AGroup+Reservation+%23%3A+149602%0D%0A%0D%0ARates%3A+%24149+-+%24179%0D%0A%0D%0ACut-off+date%3A+July+30%2C+2014%0D%0A%0D%0AReservations+line%3A+1.866.555.5555%0D%0A"
    # https://www.google.com/calendar/render?action=TEMPLATE&dates=20131119T180000/20131119T210000&text=%23VANRUBY+Hack+Night&location=Launch+Academy+(%23300+-+128+West+Hastings+Street,+Vancouver,+BC,+Canada)&details=Vancouver+Ruby+Meetup+Group%0ATuesday,+November+19+at+6:00+PM%0A%0A%23VANRUBY+hack+nights++Every+2+weeks+on+Tuesday+we+get+together+to+hack+on+cool+stuff.+Bring+a+your+laptop+and+hack+away+on+your+favourite+open+source+...%0A%0ADetails:+http://www.meetup.com/vancouver-ruby/events/149547312/&add=chuck.bergeron@gmail.com&ctok=Y2h1Y2suYmVyZ2Vyb25AZ21haWwuY29t&sf=true&output=xml
    def call
      attributes = {
        dates: "#{format_time(@hash[:dtstart])}/#{format_time(@hash[:dtend])}",
        text:  encode_string(@hash[:summary])
      }

      attributes.merge!(details:  encode_string(@hash[:description])) unless @hash[:description].blank?
      attributes.merge!(location: encode_string(@hash[:location]))    unless @hash[:location].blank?

      url = "https://www.google.com/calendar/render?action=TEMPLATE"

      attributes.each do |key, value|
        url << "&#{key}=#{value}"
      end

      url
    end

    private

      def validate!
        msg =  "- Object must be a Date, DateTime or Time object."
        raise(ArgumentError, ":dtstart #{msg} #{hash[:dtstart].class} given") unless hash[:dtstart].kind_of? Time
        raise(ArgumentError, ":dtend #{msg} #{hash[:dtend].class} given") unless hash[:dtend].kind_of? Time

        raise(ArgumentError, ":summary must be a string") unless hash[:summary].kind_of? String
        raise(ArgumentError, ":summary must not be blank") if hash[:summary].blank?
      end

      def encode_string(str)
        CGI.escape(str)
      end

      def format_time(time)
        time.utc.strftime('%Y%m%dT%H%M%SZ')
      end

  end

end
