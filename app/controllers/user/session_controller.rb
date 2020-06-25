class User::SessionController < UserApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
    
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to 'http://localhost:3000/user/user'
    else
      redirect_to 'http://localhost:3000/user/session/new'
    end
  end

  def login
  end

  def welcome
  end
  def destroy 
    session.delete(:user_id)
    @current_user = nil
    redirect_to 'http://localhost:3000/user/session'
  end
end
