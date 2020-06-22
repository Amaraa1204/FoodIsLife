class Admin::AdminController < AdminApplicationController
    skip_before_action :authorized
    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.create(params.require(:admin).permit(:user_name, :password))
        session[:admin_id] = @admin.id
        if @admin.save
			redirect_to 'http://localhost:3000/admin/welcome'
		else 
			render 'new'
		end
    end
end
