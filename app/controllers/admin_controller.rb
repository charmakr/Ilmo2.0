class AdminController < ApplicationController
  skip_before_filter :authentication_required
  before_filter :admin_authentication_required
  layout "admin"
  
  def admin_authentication_required
    unless User.find_by_id(session[:user]).account_type == "Admin"
      flash[:warning]="Pääsy kielletty"
      redirect_to "/"
      return false;
    end
  end
end
