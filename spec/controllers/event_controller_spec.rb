require 'spec_helper'

describe EventsController do

describe "POST 'create'" do
  it "emails the host with the URL" do
    EventMailer.should_receive(:new_event_email).and_return(double("mailer", :deliver => true))
    post :create
  end
end

describe "Event Routing" do
  it "routes /e/:id to EventController#show" do
    { :get => "/e/12345"}.should route_to(:controller => "events", :action => "show", :id => "12345")
  end

  it "routes /a/:id to EventController#edit" do
    { :get => "/a/12345"}.should route_to(:controller => "events", :action => "edit", :id => "12345")
  end
end

#describe "PUT 'update'" do
#  it "emails the host that a new RSVP has been entered" do
#    EventMailer.should_receive(:event_rsvp_email).and_return(double("mailer", :deliver => true))
#    put :update
#  end
#end

# describe "GET 'new'" do
#   it "returns http success" do
#     get 'new'
#     response.should be_success
#   end
# end

# describe "GET 'create'" do
#   it "returns http success" do
#     get 'create'
#     response.should be_success
#   end
# end

# describe "GET 'show'" do
#   it "returns http success" do
#     get 'show'
#     response.should be_success
#   end
# end

# describe "GET 'delete'" do
#   it "returns http success" do
#     get 'delete'
#     response.should be_success
#   end
# end

end
