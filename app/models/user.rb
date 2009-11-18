class User < ActiveRecord::Base
  def self.authenticate(username, password)
    true
  end
end
