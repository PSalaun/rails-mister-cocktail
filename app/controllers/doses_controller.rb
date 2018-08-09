class DosesController < ApplicationController

  # def index
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @doses = Dose.all
  # end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(set_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render(:new)
    end
  end

  private

  def set_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
