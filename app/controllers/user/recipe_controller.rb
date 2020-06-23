class User::RecipesController < UserApplicationController
    before_action :authorized
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
        params.require(:recipe).permit(:name, :instruction, :rating, :image, :categoryId, :authorId)
      end
    end
  