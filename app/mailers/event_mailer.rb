class EventMailer < ActionMailer::Base
  default from: "notifications@respondtous.com"

  def new_event_email(event)
    @event = event
    @url = "http://localhost:3000/e/#{event.token}"
    mail(:to => event.host_email, :subject => "New Event Created")
  end

  def event_rsvp_email(event, response)

  end
end
