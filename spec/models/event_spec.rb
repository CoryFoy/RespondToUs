require 'spec_helper'

describe Event do

  specify "should have a token generated when saved" do
    event = Event.new
    event.token.should be_nil
    event.save!
    event.token.should_not be_nil
  end

  specify "should generate different tokens for different events" do
    event1 = Event.create
    event2 = Event.create
    event1.token.should_not == event2.token
  end

  specify "should locate event information from token" do
    event = Event.new(:name => "Party", :date=>"10/31/2012", :location=>"My House", :host_email=>"example@localhost", :description=>"Party of the year!")
    event.save!
    found_event = Event.first(conditions: {token: event.token})
    found_event.should == event
  end
end
