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
      return true 
    end
    return false
  end
    
    
    def self.checkInformation(user)
      if user[:password3]!=user[:password2]
        return "Salasanat ei täsmää"
      end
      if user[:username]=="" || user[:password2]==""
        return "Tyhjiä kenttiä"
      end
    end
end
