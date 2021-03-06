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
			redirect_to url: user_recipe_index_path(@recipe)
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
		redirect_to user_recipe_index_path
	end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instruction, :rating, :image, :category_id, :author_id)
  end
end
