class Admin::RecipeController < AdminApplicationController
	def index 
		@recipe = Recipe.all
	end 

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new 
	end 

	def edit 
		@recipe = Recipe.find(params[:id])
	end 

	def create 
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			@params = recipe_ingredient_params
			@rip = RecipeAndIngredient.new
			@rip.addIngredient(@params, @recipe)
			redirect_to url: admin_recipe_index_path(@recipe)
		else 
			render 'new'
		end
	end 

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			@ingredients = RecipeAndIngredient.where("recipe_id = ?", @recipe.id)
			if @ingredients.nil?
				@params = recipe_ingredient_params
				@rip = RecipeAndIngredient.new
				@rip.addIngredient(@params, @recipe)
			else
				@ingredients.each do |i|
					i.destroy
				end
				@params = recipe_ingredient_params
				@rip = RecipeAndIngredient.new
				@rip.addIngredient(@params, @recipe)
			end
			redirect_to url: admin_recipe_index_path(@recipe)
		else
			render 'edit'
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		if @recipe.destroy
			@ingredients = RecipeAndIngredient.where("recipe_id = ?", @recipe.id)
			@ingredients.each do |i|
				i.destroy
			end
		end
		redirect_to admin_recipe_index_path
	end 

	private 
		def recipe_params
			params.require(:recipe).permit(:name, :instruction, :image, :rec_category_id, :author_id)
		end

		def recipe_ingredient_params
			params.permit(:ingredient_id => [])
		end
end
