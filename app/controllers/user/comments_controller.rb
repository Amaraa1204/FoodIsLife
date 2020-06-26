class User::CommentsController < UserApplicationController
  #before_action :authorized

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(comm_params)
    # raise @recipe.comments.inspect
    redirect_to user_recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to user_recipe_path(@recipe)
  end

  private

  def comm_params
    params.require(:comment).permit(:comment)
  end
end
