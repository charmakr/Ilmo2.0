class User < ActiveRecord::Base
  
  has_many :registrations
  has_many :exercise_groups, :through => :registrations

  
  after_create :update_newsfeed
  
  def update_newsfeed
    Newsfeed.user_registered(self)
  end
  
  
  
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
    
    
    def self.checkInformation_on_registration(user)
      if user[:password3]!=user[:password2]
        return "Salasanat ei täsmää"
      end
      if user[:username]=="" || user[:password2]==""
        return "Tyhjiä kenttiä"
      end
  end
  
  def self.checkInformation_on_update(user)
        if user[:password3]!=user[:password2]
      return "Uudet salasanat ei täsmää"     
    end
          if user[:username]=="" || user[:password2]==""
        return "Tyhjiä kenttiä"
      end
    
  end

end
