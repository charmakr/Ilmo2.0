class User < ActiveRecord::Base
  def self.authenticate(username, password)
    User.find(:first, :condititions=>["username = ? AND password = ?", username, password])
    true
  end
end
