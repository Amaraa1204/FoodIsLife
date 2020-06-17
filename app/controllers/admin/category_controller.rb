class Admin::CategoryController < ApplicationController
	def index
		@category = Category.all
	end
	def new
		@category = Category.new
		@newpath = admin_category_index_path
	end
	def edit
		@category = Category.find(params[:id])
		@editpath = admin_category_index_path(@category)
	end
	def create
		@category = Category.new(category_params)

		if @category.save
<<<<<<< HEAD
			redirect_to @category
=======
			redirect_to url: admin_user_index_path(@category)
>>>>>>> temp
		else
			render 'new'
		end
	end
	def show
		@category = Category.find(params[:id])
	end
	def update
  		@category = Category.find(params[:id])
 
  		if @category.update(category_params)
<<<<<<< HEAD
    		redirect_to @category
=======
    		redirect_to admin_user_index_path(@category)
>>>>>>> temp
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@category = Category.find(params[:id])
  		@category.destroy
 
<<<<<<< HEAD
  		redirect_to category_index_path
=======
  		redirect_to admin_category_index_path
>>>>>>> temp
	end
	private
	def category_params
		params.require(:category).permit(:categoryId, :Name)
	end
end
