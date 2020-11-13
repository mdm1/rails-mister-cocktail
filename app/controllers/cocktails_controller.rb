class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create!(strong_params)
    redirect_to cocktail_path(@cocktail.id)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name, :description)
  end
end
