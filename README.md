# AddToGoogleCal

A view layer helper which takes an object (such as an ActiveRecord instance from your database) and generates an "Add To Google Calendar" URL based on it's attributes.

This follows the ISO RFC-2445 calendar standard of using `dtstart`, `dtend`, `summary`, etc. You can customize these fields to match your implementation (ie. `start_date`, `end_date`, `event_name`, etc). Details on this below.


## Installation

Add this line to your application's Gemfile:

    gem 'add_to_google_cal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install add_to_google_cal

## Usage

### ActiveRecord:

    class Wedding < AR::Base

      has_google_cal

    end

    Wedding.first.to_google_cal

    # TODO: Support custom column names, ie:
    has_google_cal {
      :dtstart_attribute => 'crazy_date_start_column_name'
    }

### Generic Object:

    require 'ostruct'
    object = OpenStruct.new({
      :summary => "Super awesome event coming up in 2009, y'all!",
      :dtstart => '2019-03-07'
    })

    AddToGoogleCal::Builder.new(object).call
    => "https://www.google.com/calendar/render?action=TEMPLATE&dates=20190726T000000Z/20190726T000000Z& ..." (or something like this)

### Ruby Hash:

    attributes = {
      {
        dtstart: Time.utc(2013, 01, 03, 12, 00),
        dtend:   Time.utc(2013, 01, 03, 14, 00),
        summary: 'This is the Title of the Event'
      }
    }

    AddToGoogleCal::Builder.new(attributes).call
    => 'https://www.google.com/calendar/render?action=TEMPLATE&dates=20130103T120000Z/20130103T140000Z&text=This+is+the+Title+of+the+Event'


### erb might look like:

    <%= link_to("Add To Google Calendar", AddToGoogleCal.new(object).call) %>


## TODO:

* Handle converting various types of date/time objects
  * Finish the argument validation for required fields
* Support objects / structs

* Finish implementing the ActiveRecord hook
* Support custom column names in has_google_cal AR mixin


## Thanks To

@pcreux and everyone else who has colloborated / paired on this project.



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



## Why?

I was working on [Handcrafted Video Wedding Invites](http://www.craftedtoyou.com/) and this project was born out of a need to allow wedding guests quickly adding a wedding event to their Google Calendar.

http://www.craftedtoyou.com/
