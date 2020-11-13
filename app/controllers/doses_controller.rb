class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new
    @doses = Dose.all
  end

  def create
    @dose = Dose.new(strong_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    @dose.save!
    redirect_to cocktail_path(@cocktail.id)
  end

  def show
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
