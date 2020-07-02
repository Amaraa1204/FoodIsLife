class User::RecipeAndIngredientController < UserApplicationController
  skip_before_action :authorized
  def new

  end

  def create 

  end
  def search 
    if params[:ingredient_id].blank?
      puts '*** 1 ***'
      redirect_to(user_user_index_path)
    else
      @parameter = params[:ingredient_id] #includes
      recipe_ids = Array.new
      
      @ris = RecipeAndIngredient.select('id, recipe_id, group_concat(ingredient_id) as ingri_ids').group(:recipe_id)
      
      @ris.each do |ri|
        total = 0
        @parameter.each do |par|
          if(ri.ingri_ids.include?(par))
            total = total + 1 
          end  
        end
        if total > 2
          recipe_ids.push(ri.recipe_id)
        else
          if total == @parameter.length
            recipe_ids.push(ri.recipe_id)
          end
        end
      end
      @results = Recipe.where(id: recipe_ids)
      #raise @results.inspect
      if @results.blank?
        puts '*** 2 ***' 
        @results = Recipe.all
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
