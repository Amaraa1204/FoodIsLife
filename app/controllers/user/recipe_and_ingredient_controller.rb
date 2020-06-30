class User::RecipeAndIngredientController < UserApplicationController
  def new
  end

  def create 
    
  end

  private

  def recipe_and_ingredients_params
    params.require(:recipe_and_ingredients).permit(:recipe_id, {:ingridient_id => []})
  end
end
