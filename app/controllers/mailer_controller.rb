class MailerController < ApplicationController
  def show
    if params[:user]
    @destination = User.find_by_id(params[:user])
    return
  end
  flash[:warning]="Virheellinen käyttö"
  redirect_to "/"
  end
  def create
    if(User.find_by_username(params[:user]))==nil
    flash[:warning]="Virheellinen vastaanottaja"
    redirect_to "/"
    end
    UserMailer.deliver_send_mail(User.find_by_username(params[:user]),params[:subject],params[:body])
    flash[:success]="Lähetys onnistui"
    redirect_to "/"
  end
end
