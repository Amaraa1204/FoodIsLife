class User::RecipeController < UserApplicationController
  skip_before_action :authorized, only: [:show, :index]

  def index
		@recipe = Recipe.all
    
		# @cat = Category.all
		# if params[:search].present?
		# 	recipe_ids = RecipeIngridient.where(ingridient_id: params[:search]).pluck(:recipe_id)
		# 	select recipe_id from RecipeIngridient where ingridient in (1,2,3,4,5)
		# 	@recipe = Recipe.where(id: recipe_ids)
		# else
		# 	@recipe = Recipe.all
		# end
	end

	def show
    	params.permit(:id)
    	@non_rated = 5
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
			redirect_to user_recipe_index_path
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
			redirect_to url: user_recipe_index_path(@recipe)
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
			@comments = Comment.where("recipe_id = ?", @recipe.id)
			@comments.each do |i|
				i.destroy
			end
			@rates = RecipeAndRate.where("recipe_id = ?", @recipe.id)
			@rates.each do |i|
				i.destroy
			end
		end
		redirect_to "http://localhost:3000/user/user/user?"
	end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instruction, :image, :rec_category_id, :author_id)
	end

	def recipe_ingredient_params
		params.permit(:ingredient_id => [])
	end
end
