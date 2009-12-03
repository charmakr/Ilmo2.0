class UserMailer < ActionMailer::Base
   def send_mail(user, subject, message)
     if user.email=nil
       flash[:warning]="Vastaanottajalla ei mailiosoitetta"
       return
     end
      @subject = subject
      @recipients = user.email
      @from = 'no-reply@yourdomain.com'
      @sent_on = Time.now
    @body["title"] = subject
      @body["email"] = 'sender@yourdomain.com'
      @body["message"] = message
      @headers = {}
   end



end
