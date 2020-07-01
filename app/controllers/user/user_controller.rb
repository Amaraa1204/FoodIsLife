class User::UserController < UserApplicationController
    skip_before_action :authorized, only: [:new, :create, :index]
    def new
        @user = User.new
    end

    def create
        @user = User.create(params.require(:user).permit(:user_name, :email, :password))
        session[:user_id] = @user.id
        if @user.save
			redirect_to user_user_index_path
		else 
			render 'new'
		end
    end
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to url: user_user_index_path(@user)
        else
            render 'edit'
        end
    end
    
    private
    def user_params
      params.require(:user).permit(:email, :user_name, :password)
    end
end
