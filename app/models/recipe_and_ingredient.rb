class RecipeAndIngredient < ApplicationRecord
  def addIngredient(params, recipe)
    if params[:ingredient_id].nil?
      redirect_to new_user_recipe_path, alert: "Choose your ingredients!"
    else
      params[:ingredient_id].each do |p|
        ingredient_params = params.permit(:recipe_id, :ingredient_id)
        temp = ingredient_params
        temp[:recipe_id] = recipe.id
        temp[:ingredient_id] = p
        #raise @ingredient_params.inspect
        rip = RecipeAndIngredient.new(temp)
        #raise @rip.inspect
        rip.save
      end
    end
  end
end
