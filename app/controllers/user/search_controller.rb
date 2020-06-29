class User::SearchController < UserApplicationController
  skip_before_action :authorized
  def index
    if params[:search].blank?
      puts '*** 1 ***' 
      redirect_to(user_user_index_path, alert: "Empty field!") and return 
    else
      @parameter = params[:search].downcase 
      @results = Recipe.where("lower(name) LIKE :search", search: @parameter) 
      #raise @results.inspect
      if @results.blank?
        puts '*** 2 ***' 
        @results = Recipe.all
      else
        puts '*** 3 ***' 
        # redirect_to user_search_index_path
      end
    end
  end

  def show
    if params[:search].blank? 
      redirect_to(user_user_index_path, alert: "Empty field!") and return 
    else
      @parameter = params[:search].downcase 
      @results = Recipe.where("lower(name) LIKE :search", search: @parameter) 
      #raise @results.inspect
    end
  end
  # private
  # def search_params
  #   params.require(:search).permit(:recipe_name)
  # end
end
