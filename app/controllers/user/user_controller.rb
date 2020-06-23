class User::UserController < UserApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.create(params.require(:user).permit(:user_name, :email, :password))
        session[:user_id] = @user.id
        if @user.save
			redirect_to 'http://localhost:3000/user/welcome'
		else 
			render 'new'
		end
    end
end
