class User::CommentController < UserApplicationController
  def index
      @comms = Comment.all
  end

  #def show
  #  @comm = Comment.find(params[:id])
  #end

  #def new
  #  @comm = Comment.new
  #end

  #def edit
  #    @comm = Comment.find(params[:id])
  #end

  def create
    @recipe = Recipe.find(params[:recipeId])
    @comm = @recipe.comment.create(comm_params)
    redirect_to user_recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipeId])
    @comm = @recipe.comments.find(params[:id])
    @comm.destroy
    redirect_to user_recipe_path(@recipe)
  end

  private
    def comm_params
      params.require(:comment).permit(:body)
    end
end
