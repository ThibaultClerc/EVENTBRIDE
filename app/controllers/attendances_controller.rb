class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
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
  end
  
end
