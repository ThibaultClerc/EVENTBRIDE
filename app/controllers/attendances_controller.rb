class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @event = Event.find(params)
  end

  def create
    # Amount in cents
    @amount = 500
  
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
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_attendance_path
    
  end

  def index
  end
  
end
