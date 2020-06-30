class Admin::IngreCategoryController < AdminApplicationController
	def index
		@ingrecategory = IngreCategory.all
	end
	def new
		@ingrecategory = IngreCategory.new
		@newpath = admin_ingre_category_index_path
	end
	def edit
		@ingrecategory = IngreCategory.find(params[:id])
		@editpath = admin_ingre_category_path(@ingrecategory)
	end
	def create
		@ingrecategory = IngreCategory.new(ingrecategory_params)

		if @ingrecategory.save
			redirect_to url: admin_ingre_category_index_path(@ingrecategory)
		else
			render 'new'
		end
	end
	def show
		@ingrecategory = IngreCategory.find(params[:id])
	end
	def update
  		@ingrecategory = IngreCategory.find(params[:id])
 
  		if @ingrecategory.update(ingrecategory_params)
    		redirect_to admin_ingre_category_index_path(@ingrecategory)
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@ingrecategory = IngreCategory.find(params[:id])
  		@ingrecategory.destroy
 
  		redirect_to admin_ingre_category_index_path
	end
	private
	def ingrecategory_params
		params.require(:ingre_category).permit(:name, :image)
	end
end