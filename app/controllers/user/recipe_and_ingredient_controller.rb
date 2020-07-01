class User::RecipeAndIngredientController < UserApplicationController
  def new
    @recipe_and_ingredients = RecipeAndIngredient.new
  end

  def create 
    @rip = RecipeAndIngredient.new(@recipe_and_ingredients_params)
		@rip.save
  end

  private

  def recipe_and_ingredients_params
    params.require(:recipe_and_ingredients).permit(:recipe_id, :ingredient_id)
  end
end
