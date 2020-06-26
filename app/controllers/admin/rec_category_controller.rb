class Admin::RecCategoryController < AdminApplicationController
    def index
		@reccategory = RecCategory.all
	end
	def new
		@reccategory = RecCategory.new
		@newpath = admin_rec_category_index_path
	end
	def edit
		@reccategory = RecCategory.find(params[:id])
		@editpath = admin_rec_category_path(@reccategory)
	end
	def create
		@reccategory = RecCategory.new(reccategory_params)

		if @reccategory.save
			redirect_to url: admin_rec_category_index_path(@reccategory)
		else
			render 'new'
		end
	end
	def show
		@reccategory = RecCategory.find(params[:id])
	end
	def update
  		@reccategory = RecCategory.find(params[:id])
 
  		if @reccategory.update(reccategory_params)
    		redirect_to admin_rec_category_index_path(@reccategory)
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@reccategory = RecCategory.find(params[:id])
  		@reccategory.destroy
 
  		redirect_to admin_rec_category_index_path
	end
	private
	def reccategory_params
		params.require(:rec_category).permit(:name)
	end
end
