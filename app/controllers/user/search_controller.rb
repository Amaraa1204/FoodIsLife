class User::SearchController < UserApplicationController
    skip_before_action :authorized
    def create
        if search_params
            @search = Recipe.where('name LIKE ?', "%#{search_params}%") 
        else 
            @search = Recipe.all
        end
    end
    private
    def search_params
        params.require(:search).permit(:recipe_name)
    end
end
