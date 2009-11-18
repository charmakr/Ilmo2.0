class User < ActiveRecord::Base
  def self.authenticate(username, password)
    u = User.find(:first, :conditions=>["username = ? AND password = ?", username, password])
    if u==nil
      raise ArgumentError.new("Login failed")
    end
    
    return u
  end
  def self.register(username, password)
        u = User.find(:first, :conditions=>["username = ?", username])        
    if u==nil
      User.create(:username=>username, :password=>password)
      flash[:sucsess]="Käyttäjän luonti onnistui"
      return
    end
    flash[:warning]="Käyttäjänimi on jo käytössä"
  end
    
    
end
