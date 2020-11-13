class ReviewsController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @review = Review.new(strong_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save!
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def strong_params
    params.require(:review).permit(:rating, :content, :username)
  end

end
