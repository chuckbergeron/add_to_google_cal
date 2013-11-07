require 'spec_helper'

describe AddToGoogleCal do

  describe "has_google_cal" do

    it "should respond_to gcal_href" do
      expect(Wedding.new).to respond_to?(:gcal_href)
    end

    describe "#gcal_href" do

      it "builds the add to google cal link" do
        expect(Wedding.new.gcal_href).to match[/google.com/]
      end

    end

  end

end
