# Controller that implements the logic for the bookings of the articles. Articles are booked
# for a particular time frame and charged by a day rate.
class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @user = current_user
  end

  def show
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    # Assign the booking to the current user
    @booking.user = current_user
    # Assign the booking the article that was selected
    @booking.article = Article.find(params[:article_id])
    # Calculate price
    @booking.price = price_calc(@booking.start_date, @booking.end_date, @booking.article.price)
    # Booking saved to db if valid, otherwise inputs are saved in the view
    if @booking.save
      flash[:success] = "You have booked access to the article!"
      redirect_to article_path(@booking.article)
    else
      render :new
    end
  end

  private

  # Whitelist and return a hash of the params required
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end

  def price_calc(start_date, end_date, price_per_day)
    price_per_day ||= 0
    return (end_date - start_date).to_i * price_per_day
  end
end
