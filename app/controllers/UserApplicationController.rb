class UserApplicationController < ApplicationController
    before_action :authorized
    helper_method :current_user
    helper_method :user_logged_in?
    def current_user
        User.find_by(id: session[:user_id])
    end
    def user_logged_in?
        !current_user.nil?
    end
    def authorized
        redirect_to user_session_index_path unless user_logged_in?
    end
end
