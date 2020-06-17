class IngredientController < ApplicationController
  def index
      @ingres = Ingredient.all
  end

  def show
    @ingre = Ingredient.find(params[:id])
  end

  def new
    @ingre = Ingredient.new
    @newpath = ingredient_index_path
  end

  def edit
      @ingre = Ingredient.find(params[:id])
      @editpath = ingredient_path(@ingre)
  end

  def create
    @ingre = Ingredient.new(ingre_params)

    if @ingre.save
      redirect_to ingredient_index_path
    else
      render 'new'
    end
  end

  def update
    @ingre = Ingredient.find(params[:id])

    if @ingre.update(ingre_params)
      redirect_to @ingre
    else
      render 'edit'
    end
  end

  def destroy
    @ingre = Ingredient.find(params[:id])
    @ingre.destroy

    redirect_to ingredient_index_path
  end

  private
    def ingre_params
      params.require(:ingredient).permit(:name, :categoryId, :calories)
    end
  end
