class Admin::SessionsController < AdminApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
    
  end

  def create
    @admin = Admin.find_by(user_name: params[:user_name])
    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to 'http://localhost:3000/admin/welcome'
    else
      redirect_to 'http://localhost:3000/admin/login'
    end
  end

  def login
    
  end

  def welcome
  end
end