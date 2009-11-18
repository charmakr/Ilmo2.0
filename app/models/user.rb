class User < ActiveRecord::Base
  def self.authenticate(username, password)
    u = User.find(:first, :conditions=>["username = ? AND password = ?", username, password])
    if u==nil
      raise ArgumentError.new("Login failed")
    end
    
    return u
  end
end
