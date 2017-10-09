class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Get the rental that the logged in user has made
    @rentals = Rental.where(user: current_user)
  end

  def show
  end

  def new
    # New rental for our form
    @rental = Rental.new
    # The video_id come from the URL (bit after the ?)
    @rental.video = Video.find(params[:video_id])
  end

  def create
    rental_params = params.require(:rental).permit(:video_id)

    # New rental to save to database
    @rental = Rental.new
    @rental.video = Video.find(rental_params[:video_id])
    @rental.user = current_user
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => rental.video.name,
      :currency    => 'aud'
    )
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
