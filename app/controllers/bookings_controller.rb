# Controller that implements the logic for the bookings of the articles. Articles are booked 
# for a particular time frame and charged by a day rate.
class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.article = Article.find(params[:article_id])
    # If the booking is valid it will save to the db, otherwise retain info inputted
    if @booking.save
      redirect_to user_path(@booking.article)
    else
      render :new
    end
  end

  private

  # Whitelist and return a hash of the params required
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end
end
