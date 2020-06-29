class User::RecipeAndRateController < UserApplicationController
  def create
    if RecipeAndRate.where(recipe_id: params[:recipe_id], user_id: current_user.id).count == 0
      @recipe = Recipe.find(params[:recipe_id])
      @rate = @recipe.recipe_and_rates.create(rate: rate_params[:rate], user_id: current_user.id)
      redirect_to user_recipe_path(@recipe)
    else
      @recipe = Recipe.find(params[:recipe_id])
      redirect_to user_recipe_path(@recipe), alert: 'You have already rated this recipe!'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @rate = @recipe.recipe_and_rates.find(params[:id])
    @rate.destroy
    redirect_to user_recipe_path(@recipe)
  end

  private
  def rate_params
    params.require(:recipe_and_rate).permit(:rate)
  end
end
