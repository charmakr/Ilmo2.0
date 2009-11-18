class RegistrationsController < ApplicationController
  skip_before_filter :authentication_required
  def index
    
  end
end
