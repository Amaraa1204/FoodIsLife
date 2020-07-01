class User::FavouriteController < ApplicationController
	# before_action :set_variables
	def set_variables
 		@favVar = session[:user_id]
 		@recipeVar = params[:recipe_id]

 		 
 		if params[:commit] == 'Favourite'

 			redirect_to "http://localhost:3000/user/user/user?"
		end
 		
	end
	def index
		@favourite = Favourite.where(user_id: session[:user_id])
	end
	def create
		params.permit(:recipe_id)
		@favourite = Favourite.new(user_id: session[:user_id], recipe_id: params[:recipe_id])
		@favourite.save
	end
	def destroy
		@favourite = Favourite.find(params[:id])
		@favourite.destroy
		redirect_to "http://localhost:3000/user/user/user?"
	end
	private
	def favourite_params
		params.require(:favourite).permit(:user_id, :recipe_id)
	end
end
