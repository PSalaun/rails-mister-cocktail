class DosesController < ApplicationController

  # def index
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @doses = Dose.all
  # end

  # def new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  # end

  def create
    @dose = Dose.new(set_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render(:new)
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:dose_id])
    render 'cocktails/show'
  end

  def update
    @dose = Dose.find(params[:id])
    if @dose.update(set_params)
      redirect_to cocktail_path(@dose.cocktail)
    else
      render(:edit)
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
