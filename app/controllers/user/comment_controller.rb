class User::CommentController < ApplicationController
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

  #  @comm = Comment.new(comm_params)

  #  if @comm.save
  #    redirect_to user_comment_index_path
  #  else
  #    render 'new'
  #  end
  end

  #def update
  #  @comm = Comment.find(params[:id])

  #  if @comm.update(comm_params)
  #    redirect_to user_comment_index_path
  #  else
  #    render 'edit'
  #  end
  #end

  def destroy
  #  @comm = Comment.find(params[:id])
  #  @comm.destroy

  #  redirect_to user_comment_index_path
  #end

  #private
  #  def comm_params
  #    params.require(:comment).permit(:userId, :recipeId, :comment)
   end
end
