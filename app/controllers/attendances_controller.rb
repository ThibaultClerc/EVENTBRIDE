class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
    if current_user.id == @event.admin.id
    else
    redirect_to event_path
    end
  end

  def create
    @event = Event.find(params[:event_id])
    @amount = @event.price
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Paiement de foobarlol",
      currency: 'eur',
    })
  
    @event.participants << current_user
      flash[:success] = "Tu participes maintenant à l'évènement !"
      redirect_to @event


    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_attendance_path
    
  end

  def index
    @event = Event.find(params[:event_id])
    @participants = @event.participants
    puts "$"*60
    puts "$"*60
    @participant_reservation_date = @event.attendances
    puts "$"*60
    puts "$"*60
  end
  
end
