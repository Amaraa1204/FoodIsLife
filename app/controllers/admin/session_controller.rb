class Admin::SessionController < AdminApplicationController
  skip_before_action :authorized, only: [:new, :create, :index]
  def new
    
  end

  def create
    @admin = Admin.find_by(user_name: params[:user_name])
    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to admin_admin_index_path
    else
      redirect_to new_admin_session_path
    end
  end

  def login
  end

  def destroy 
    session.delete(:admin_id)
    @current_admin = nil
    redirect_to admin_session_index_path
  end
end
