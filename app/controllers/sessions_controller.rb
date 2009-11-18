class SessionsController < ApplicationController
  skip_before_filter :authentication_required
  def create
  end
end
