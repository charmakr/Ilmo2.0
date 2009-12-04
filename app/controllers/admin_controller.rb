class AdminController < ApplicationController
  skip_before_filter :authentication_required
  before_filter :admin_authentication_required
  layout "admin"
  
  def admin_authentication_required
    
  end
end
