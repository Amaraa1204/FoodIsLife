class User::RecipeAndIngredientController < UserApplicationController
  skip_before_action :authorized
  def new
  end

  def create 
    
  end
  def search 
    if params[:rec_cate].blank?
      puts '*** 1 ***' 
      redirect_to(user_user_index_path)
    else
      @parameter = params[:rec_cate]
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
    params.require(:recipe_and_ingredients).permit(:recipe_id, {:ingridient_id => []})
  end   
end
