class HomeController < ApplicationController
  def index
    @event = Event.new
  end

end
