class Newsfeed < ActiveRecord::Base
  
  def self.user_registered(user)
    self.create :message => "Käyttäjä "+ user.username + " rekisteröityi järjestelmään"
  end
end
