class User::RecCategoryController < UserApplicationController
    def index
		@reccategory = RecCategory.all
	end
	def new
		@reccategory = recCategory.new
		@newpath = reccategory_index_path
	end
	def edit
		@reccategory = recCategory.find(params[:id])
		@editpath = reccategory_path(@reccategory)
	end
	def create
		@reccategory = recCategory.new(reccategory_params)

		if @reccategory.save
			redirect_to @reccategory
		else
			render 'new'
		end
	end
	def show
		@reccategory = recCategory.find(params[:id])
	end
	def update
  		@reccategory = recCategory.find(params[:id])
 
  		if @reccategory.update(reccategory_params)
    		redirect_to @reccategory
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@reccategory = recCategory.find(params[:id])
  		@reccategory.destroy
 
  		redirect_to reccategory_index_path
	end
	private
	def reccategory_params
		params.require(:reccategory).permit(:id, :Name)
	end
end
end
