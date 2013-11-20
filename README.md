# AddToGoogleCal

A view layer helper which takes an object (such as an ActiveRecord instance from your database) and generates an "Add To Google Calendar" URL based on it's attributes.

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

      has_google_cal {
        :date_attribute_name => 'crazy_date'
      }

    end

    Wedding.first.to_google_cal

### Generic Ruby Object:

    require 'ostruct'
    @object = OpenStruct.new({
      :description => "Super awesome event coming up in 2009, y'all!",
      :date => '2019-03-07'
    })

    AddToGoogleCal.new(@object).call
    => "https://www.google.com/calendar/render?action=TEMPLATE&dates=20190726T000000Z/20190726T000000Z& ..." (or something like this)


### erb might look like:

    <%= AddToGoogleCal.new(@object).call %>

So long as your object responds to ...


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
