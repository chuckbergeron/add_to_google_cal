require 'add_to_google_cal/version'

require 'active_support/core_ext'
require File.join(File.dirname(__FILE__), "add_to_google_cal/railtie")

module AddToGoogleCal

  autoload :Hook, File.join(File.dirname(__FILE__), "add_to_google_cal/hook")
  autoload :InstanceMethods, File.join(File.dirname(__FILE__), "add_to_google_cal/instance_methods")

end
