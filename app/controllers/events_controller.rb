class EventsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.admin_id = current_user.id
    if @event.save
      flash[:success] = "Ton évènement a bien été créé !"
      redirect_to event_path(@event.id)
    else
      flash.now[:error] = @event.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @admin = Event.find(params[:id]).admin
  end

  def edit
    @event = Event.find(params[:id])
    if current_user.id == @event.admin.id
    else
    redirect_to event_path
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
  end




  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end




end
