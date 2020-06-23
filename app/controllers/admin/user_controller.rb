class Admin::UserController < AdminApplicationController  
    before_action :authorized  

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
            redirect_to url: admin_user_index_path(@user)
        else 
            render 'new'
        end
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to admin_user_index_path
    end
    private
    def user_params
      params.require(:user).permit(:email, :user_name, :password)
    end
end
