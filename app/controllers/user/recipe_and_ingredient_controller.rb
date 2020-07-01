class User::RecipeAndIngredientController < UserApplicationController
  skip_before_action :authorized
  def new
    @recipe_and_ingredients = RecipeAndIngredient.new
  end

  def create 
    @rip = RecipeAndIngredient.new(@recipe_and_ingredients_params)
		@rip.save
  end
  def search 
    if params[:ingre].blank?
      puts '*** 1 ***' 
      redirect_to(user_user_index_path)
    else
      @parameter = params[:ingre]
      @results = RecipeAndIngredient.where(ingredient_id: @parameter) 
      #raise @results.inspect
      if @results.blank?
        puts '*** 2 ***' 
        @results = RecipeAndIngredient.all
      else
        puts '*** 3 ***' 
        # redirect_to user_search_index_path
      end
    end
  end 

  private

  def recipe_and_ingredients_params
    params.require(:recipe_and_ingredients).permit(:recipe_id, :ingredient_id)
  end
end
