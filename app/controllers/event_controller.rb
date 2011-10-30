class EventController < ApplicationController
  def new
  end

  def create
    @event = Event.create!(params[:event])
  end

  def show
    puts params[:token]
    @event = Event.first(conditions: {token: params[:token]}) 
    puts @event.inspect
  end

  def delete
  end

end
