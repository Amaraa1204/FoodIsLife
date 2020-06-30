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
		raise @recipe.inspect
		if @recipe.save
			
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
end
