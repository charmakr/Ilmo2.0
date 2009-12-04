class User < ActiveRecord::Base
  
  has_many :registrations
  has_many :exercise_groups, :through => :registrations
  
  validates_length_of :username, :in => 3..20
  validates_length_of :password, :in => 3..20
  validates_confirmation_of :password
  validates_uniqueness_of :username
  
  after_create :update_newsfeed
  
  def update_newsfeed
    Newsfeed.user_registered(self)
  end
  
  
  
  def self.authenticate(username, password)
    u = User.find(:first, :conditions=>["username = ? AND password = ?", username, password])
    if u==nil
      return false
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
    
    

end
