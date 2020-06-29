class User::RecCategoryController < UserApplicationController
  skip_before_action :authorized
  def search 
    if params[:rec_cate].blank?
      puts '*** 1 ***' 
      redirect_to(user_user_index_path)
    else
      @parameter = params[:rec_cate]
      @results = Recipe.where(rec_category_id: @parameter) 
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
end
