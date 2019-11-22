class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    # render 'cocktails/index'
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(
      name: params['cocktail']['name'],
    )
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end
end
