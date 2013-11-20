require 'spec_helper'

describe AddToGoogleCalBuilder do

  let(:default_attributes) { 
    {
      dtstart: Time.utc(2013, 01, 03, 12, 00),
      dtend: Time.utc(2013, 01, 03, 14, 00),
      summary: 'This is the Title of the Event'
    }
  }

  subject do
    AddToGoogleCalBuilder.new(default_attributes)
  end

  it "generates the dates" do
    url = subject.call

    url.should include("&dates=20130103T120000Z/20130103T140000Z")
  end

  it 'maps summary to text' do
    url = subject.call

    url.should include("&text=This+is+the")
  end

  it 'supports a location' do
    subject.hash.merge!(location: "Vancouver, BC")
    url = subject.call

    url.should include("&location=Vancouver%2C+BC")
  end

  it 'maps description to details' do
    subject.hash.merge!(description: "Hey: How@are.you & there!")
    url = subject.call

    url.should include("&details=Hey%3A+How%40are.you+%26+there%21")
  end

  describe '#new' do

    it 'takes a hash or an object' do

    end

  end


  # AR Implementation
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
