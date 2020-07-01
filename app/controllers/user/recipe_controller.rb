class User::RecipeController < UserApplicationController
  before_action :authorized

  def index
    @recipe = Recipe.all
    /
		@cat = Category.all
		if params[:search].present?
			recipe_ids = RecipeIngridient.where(ingridient_id: params[:search]).pluck(:recipe_id)
			select recipe_id from RecipeIngridient where ingridient in (1,2,3,4,5)
			@recipe = Recipe.where(id: recipe_ids)
		else
			@recipe = Recipe.all
		end/
	end

	def show
    params.permit(:id)
    #@non_rated = 5
		@recipe = Recipe.find(params[:id])
    #@rate = RecipeAndRate.select('avg(rate) as ave_rate').where(recipe_id: params[:id]).group('recipe_id')[0]
    #@non_rated =- @rate.ave_rate if @rate.present?
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

			redirect_to user_recipe_index_path
		else
			render 'new'
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to url: user_recipe_index_path(@recipe)
		else
			render 'edit'
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
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
