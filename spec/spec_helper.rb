# require 'rubygems'
# require 'bundler/setup'

require 'add_to_google_cal'

sqlite_file = File.dirname(__FILE__) + "/support/add_to_google_cal.sqlite3"
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => sqlite_file)

load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'
load File.dirname(__FILE__) + '/support/data.rb'

RSpec.configure do |config|

end
