# lib/add_to_google_cal/railtie.rb
require 'rails'
require 'add_to_google_cal'

module AddToGoogleCal

  class Railtie < Rails::Railtie

    config.to_prepare do
      ActiveRecord::Base.send(:extend, AddToGoogleCal::Hook)
    end

  end

end
