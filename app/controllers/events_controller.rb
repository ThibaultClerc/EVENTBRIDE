class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
  end

  def show
    @event = Event.find(params[:id])
    @admin = Event.find(params[:id]).admin
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end
end
