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
			#raise @params.inspect
			@params[:ingredient_id].each do |p|
				@ingredient_params = params.permit(:recipe_id, :ingredient_id)
				temp = @ingredient_params
				temp[:recipe_id] = @recipe.id
				temp[:ingredient_id] = p
				#raise @ingredient_params.inspect
				@rip = RecipeAndIngredient.new(temp)
				#raise @rip.inspect
				@rip.save
			end
			redirect_to url: admin_recipe_index_path(@recipe)
		else 
			render 'new'
		end
	end 

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to url: admin_recipe_index_path(@recipe)
		else
			render 'edit'
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to admin_recipe_index_path
	end 

	private 
		def recipe_params
			params.require(:recipe).permit(:name, :instruction, :rating, :image, :rec_category_id, :author_id)
		end

		def recipe_ingredient_params
			params.permit(:ingredient_id => [])
		end
end
