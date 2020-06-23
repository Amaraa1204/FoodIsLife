class CommentController < ApplicationController
class User::CommentController < ApplicationController
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
