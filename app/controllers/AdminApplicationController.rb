class AdminApplicationController < ApplicationController
  before_action :authorized
  helper_method :current_admin
  helper_method :admin_logged_in?

  def current_admin
    Admin.find_by(id: session[:admin_id])
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def authorized
    redirect_to '/admin/session' unless admin_logged_in?
  end
end
