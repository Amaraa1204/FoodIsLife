class User::SearchController < UserApplicationController
  skip_before_action :authorized
  def create
    if params[:search].blank? 
      redirect_to(user_user_index_path, alert: "Empty field!") and return 
    else
      @parameter = params[:search].downcase 
      @results = Recipe.all.where("name LIKE :search", search: @parameter) 
      redirect_to(user_search_index_path, alert: "Fuck off")
    end
  end
  # private
  # def search_params
  #   params.require(:search).permit(:recipe_name)
  # end
end
