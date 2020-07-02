class User::RecCategoryController < UserApplicationController
  skip_before_action :authorized
  def search 
    if params[:rec_cate].blank?
      puts '*** 1 ***' 
      @results = Recipe.all
      flash.now[:alert] = 'No such category.'
      render 'user/recipe/index'
    else
      @parameter = params[:rec_cate]
      @results = Recipe.where(rec_category_id: @parameter) 
      #raise @results.inspect
      if @results.blank?
        puts '*** 2 ***' 
        @results = Recipe.all
        flash.now[:alert] = 'Sorry, no results.'
        render 'user/recipe/index'
      else
        puts '*** 3 ***' 
        # redirect_to user_search_index_path
        #raise @results.inspect
        
        render 'user/recipe/index'
      end
    end
  end 
end
