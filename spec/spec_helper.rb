require 'rubygems'
require 'bundler/setup'

require 'add_to_google_cal'


ActiveRecord::Base.establish_connection(:adapter => "sqlite3",
                                        :database => File.dirname(__FILE__) + "/add_to_google_cal.sqlite3")

RSpec.configure do |config|

end
