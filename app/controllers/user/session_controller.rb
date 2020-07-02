class User::SessionController < UserApplicationController
  skip_before_action :authorized, only: [:new, :create, :index]
  def new
    
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_user_index_path
    else
      redirect_to new_user_session_path
    end
  end

  def login
  end

  def welcome
  end
  def destroy 
    session.delete(:user_id)
    @current_user = nil
    redirect_to user_user_index_path
  end
end
