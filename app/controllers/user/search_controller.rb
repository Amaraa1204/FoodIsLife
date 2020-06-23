class User::SearchController < UserApplicationController
    skip_before_action :authorized
    def index
        if params[:recipe_name]
            @search = Recipe.where('name LIKE ?', "%#{params[:recipe_name]}%") 
        else 
            @search = Recipe.all
        end
    end
    private
    def search_params
        params.require(:search).permit(:recipe_name)
    end
end
