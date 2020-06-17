<<<<<<< HEAD
class UserController < ApplicationController
=======
class Admin::UserController < ApplicationController     
>>>>>>> temp
    def index 
        @user = User.all
    end

    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end

    def create
        /raise params.inspect/
        @user = User.new(user_params)

        if @user.save
<<<<<<< HEAD
            redirect_to @user
=======
            redirect_to url: admin_user_index_path(@user)
>>>>>>> temp
        else 
            render 'new'
        end
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy

<<<<<<< HEAD
        redirect_to user_index_path
=======
        redirect_to admin_user_index_path
>>>>>>> temp
    end
    private
    def user_params
      params.require(:user).permit(:email, :user_name, :password)
    end
end
