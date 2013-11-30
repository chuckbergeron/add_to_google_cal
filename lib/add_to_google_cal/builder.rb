module AddToGoogleCal

  class Builder

    # TODO: Find out which attributes are optional (details? text? dates?)

    attr_accessor :hash

    def initialize(object_or_hash)
      self.hash = object_or_hash
      validate
    end

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

      def validate
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
