
class Admin::IngredientController < AdminApplicationController
  def index
      @ingres = Ingredient.all
  end

  def show
    @ingre = Ingredient.find(params[:id])
  end

  def new
    @ingre = Ingredient.new
  end

  def edit
      @ingre = Ingredient.find(params[:id])
  end

  def create
    @ingre = Ingredient.new(ingre_params)

    if @ingre.save
      redirect_to admin_ingredient_index_path
    else
      render 'new'
    end
  end

  def update
    @ingre = Ingredient.find(params[:id])

    if @ingre.update(ingre_params)
      redirect_to admin_ingredient_path
    else
      render 'edit'
    end
  end

  def destroy
    @ingre = Ingredient.find(params[:id])
    @ingre.destroy

    redirect_to admin_ingredient_index_path
  end

  private
    def ingre_params
      params.require(:ingredient).permit(:name, :category_id, :calories)
    end
  end
