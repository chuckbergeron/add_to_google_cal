require 'spec_helper'

describe AddToGoogleCalBuilder do

  describe "dates" do
    it "generates the dates" do
      add = AddToGoogleCalBuilder.new(dtstart: Time.utc(2013, 01, 03, 12, 00),
        dtend: Time.utc(2013, 01, 03, 14, 00))
      url = add.call

      url.should include("&dates=20130103T120000Z/20130103T140000Z")
    end
  end

  describe '#new' do

    it 'expects an object' do

    end

  end

  describe "has_google_cal" do

    xit "should respond_to gcal_href" do
      expect(Wedding.new).to respond_to?(:gcal_href)
    end

    describe "#gcal_href" do

      xit "builds the add to google cal link" do
        expect(Wedding.new.gcal_href).to match(/google.com/)
      end

    end

  end

end
