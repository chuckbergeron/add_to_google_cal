require 'spec_helper'

describe AddToGoogleCalBuilder do

  let(:default_attributes) { 
    {
      dtstart: Time.utc(2013, 01, 03, 12, 00),
      dtend: Time.utc(2013, 01, 03, 14, 00),
      summary: 'This is the Title of the Event'
    }
  }

  it "generates the dates" do
    add = AddToGoogleCalBuilder.new(default_attributes)
    url = add.call

    url.should include("&dates=20130103T120000Z/20130103T140000Z")
  end

  it 'includes the text (or title)' do
    add = AddToGoogleCalBuilder.new(default_attributes)
    url = add.call

    url.should include("&text=This+is+the")
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
