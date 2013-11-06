require 'spec_helper'

describe AddToGoogleCal do

  pending "write it"

  describe "has_google_cal" do

    it "should respond_to gcal_href" do
      ActiveRecord::Base.new.should respond_to? :gcal_href
    end

    describe "#gcal_href" do

      it "builds the add to google cal link" do
        ActiveRecord::Base.new.gcal_href.should match[/google.com/]
      end

    end

  end

end
