require 'spec_helper'

describe AddToGoogleCal::Builder do

  let(:default_attributes) {
    {
      dtstart: Time.utc(2013, 01, 03, 12, 00),
      dtend:   Time.utc(2013, 01, 03, 14, 00),
      summary: 'This is the Title of the Event'
    }
  }

  subject { AddToGoogleCal::Builder.new(default_attributes) }

  it "generates the dates" do
    expect(subject.call).to include("&dates=20130103T120000Z/20130103T140000Z")
  end

  it 'maps summary to text' do
    expect(subject.call).to include("&text=This+is+the")
  end

  it 'supports a location' do
    subject.hash.merge!(location: "Vancouver, BC")

    subject.call.should include("&location=Vancouver%2C+BC")
  end

  it 'maps description to details' do
    subject.hash.merge!(description: "Hey: How@are.you & there!")

    subject.call.should include("&details=Hey%3A+How%40are.you+%26+there%21")
  end

  it "should raise ArgumentError for a dtstart that is not a date/time" do
    subject.hash[:dtstart] = ''
    expect { subject.send(:validate!) }.to raise_error(ArgumentError)
  end

  it "should raise ArgumentError for a dtend that is not a date/time" do
    subject.hash[:dtend] = ''
    expect { subject.send(:validate!) }.to raise_error(ArgumentError)
  end

  it "should raise ArgumentError for a summary that is not stringify'able or is blank" do
    subject.hash[:summary] = ''
    expect { subject.send(:validate!) }.to raise_error(ArgumentError)
  end

  # AR Implementation
  describe "has_google_cal" do

    subject { Wedding.create(default_attributes) }

    it "accepts options" do
      expect(subject.to_gcal).to include("&dates=20130103T120000Z/20130103T140000Z")
    end

    it "builds the add to google cal link" do
      puts Wedding.new.to_gcal
      expect(Wedding.new.to_gcal).to include("&dates=20130103T120000Z/20130103T140000Z")
    end

  end

end
