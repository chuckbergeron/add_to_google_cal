module AddToGoogleCal

  module Hook

    def has_google_cal(*args)
      options = args.extract_options!

      include AddToGoogleCal::InstanceMethods
    end

  end

end
