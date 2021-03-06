# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :authentication_required
  before_filter :set_locale
  
  def authentication_required
    unless session[:user]
      flash[:warning]="Kirjaudu sisään ensin"
      redirect_to sessions_url
      return false;
    end
  end
  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
      session[:locale]= params[:locale]
      return
    end
    if session[:locale]
      I18n.locale = session[:locale]
    end    
  end
end
