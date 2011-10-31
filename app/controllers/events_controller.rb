class EventsController < ApplicationController
  def new
  end

  def create
    event = Event.create!(params[:event])
    EventMailer.new_event_email(event).deliver
    flash[:notice] = "Your event has been created! You can access it at http://localhost:3000/e/#{event.token}"
    redirect_to :action => "show", :id => event.token
  end

  def show
    @event = Event.first(conditions: {token: params[:id]}) 
    @counts = {:yes => 0, :no => 0, :maybe => 0}
    @event.responses.each do |event_response|
      case event_response.is_coming
        when "Yes"
          @counts[:yes] += 1
        when "No"
          @counts[:no] += 1
        else
          @counts[:maybe] += 1
      end
    end
  end

  def update
    event = Event.first(conditions: {token: params[:event][:token]}) 
    event.responses.create!(params[:event][:response])
    flash[:notice] = "Your response has been saved!"
    redirect_to :action => "show", :id => event.token
  end

  def delete
  end

end
