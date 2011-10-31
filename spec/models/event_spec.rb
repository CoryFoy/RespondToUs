require 'spec_helper'

describe Event do

  specify "should have a token generated when saved" do
    event = Event.new
    event.token.should be_nil
    event.save!
    event.token.should_not be_nil
  end

  specify "should have an admin token generated when saved" do
    event = Event.new
    event.admin_token.should be_nil
    event.save!
    event.admin_token.should_not be_nil
  end

  specify "should generate different tokens for different events" do
    event1 = Event.create
    event2 = Event.create
    event1.token.should_not == event2.token
  end

  specify "should be able to locate an event by token with helper method" do
    event = Event.new(:name => "Party", :date=>"10/31/2012", :location=>"My House", :host_email=>"example@localhost", :description=>"Party of the year!")
    event.save!
    found_event = Event.first(conditions: {token: event.token})
    found_event.should == event
    event_found_by_helper = Event.find_by_token(event.token)
    event_found_by_helper.should == found_event
  end

  specify "should locate event information from token" do
    event = Event.new(:name => "Party", :date=>"10/31/2012", :location=>"My House", :host_email=>"example@localhost", :description=>"Party of the year!")
    event.save!
    found_event = Event.first(conditions: {token: event.token})
    found_event.should == event
  end

  specify "should locate event information from admin token" do
    event = Event.new(:name => "Party", :date=>"10/31/2012", :location=>"My House", :host_email=>"example@localhost", :description=>"Party of the year!")
    event.save!
    found_event = Event.first(conditions: {admin_token: event.admin_token})
    found_event.should == event
  end
end
