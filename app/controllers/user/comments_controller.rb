class User::CommentsController < UserApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    #raise params.inspect
    if comm_params[:comment] = ""
      redirect_to user_recipe_path(@recipe.id), alert: "Please write a comment!"
    else
      @comment = @recipe.comments.create(comment: comm_params[:comment], user_id: current_user.id)
      redirect_to user_recipe_path(@recipe)
    end
    # raise @recipe.comments.inspect
    
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
