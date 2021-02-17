class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id]) # restaurant for the form
    @review = Review.new # empty review for the form
  end

  def create
    @review = Review.new(strong_params)
    @restaurant = Restaurant.find(params[:restaurant_id]) # restaurant for the review
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render(:new) # render the new.html.erb
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy # when this runs, the review is killed in the DB, but not in RAM
    @restaurant = @review.restaurant
    redirect_to restaurant_path(@restaurant.id)
  end

  private
  
  def strong_params
    params.require(:review)
          .permit(:content)
  end
end
