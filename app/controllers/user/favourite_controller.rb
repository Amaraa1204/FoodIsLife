class User::FavouriteController < ApplicationController
	before_action :set_variables
	def set_variables
 		@favVar = session[:user_id]
 		@recipeVar = 3
	end
	def index
		@favourite = Favourite.where(user_id: @favVar)
	end
	def create
		@favourite = Favourite.new(user_id: @favVar, recipe_id: @recipeVar)
		@favourite.save
	end
	private
	def favourite_params
		params.require(:favourite).permit(:user_id, :recipe_id)
	end
end
