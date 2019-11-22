class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
  end

  def create
    @dose = Dose.new(set_params)
    @dose = Dose.new(
      cocktail_id:      params['dose']['cocktail_id'],
      ingredient_id:    params['dose']['ingredient_id'],
      description:       params['dose']['description']
    )
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render 'new'
    end
  end

  def set_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
