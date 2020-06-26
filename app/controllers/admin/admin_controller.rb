class Admin::AdminController < AdminApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.create(params.require(:admin).permit(:user_name, :password))
        session[:admin_id] = @admin.id
        if @admin.save
			redirect_to admin_admin_index_path
		else 
			render 'new'
		end
    end
end
