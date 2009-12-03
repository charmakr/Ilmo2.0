class MailerController < ApplicationController
  def show
    if params[:user]
    @destination = params[:user]
  end
  flash[:warning]="Virheellinen käyttö"
  redirect_to "/"
  end
  def create
    if(User.find_by_username(params[:user]))==nil
    flash[:warning]="Virheellinen vastaanottaja"
    redirect_to "/"
    end
    UserMailer.send_message(User.find_by_username(params[:user]),params[:subject],params[:body])
  end
end
