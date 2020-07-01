class User::UserController < UserApplicationController
    skip_before_action :authorized, only: [:new, :create, :index]
    def show 
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
		if @user.update(params.require(:user).permit(:user_name, :email, :password))
			redirect_to url: user_user_path(@user)
		else
			render 'edit'
		end
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
     
    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to user_user_index_path
    end
end
