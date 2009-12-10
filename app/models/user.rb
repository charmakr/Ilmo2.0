class User < ActiveRecord::Base
  
  has_many :registrations, :dependent => :destroy
  has_many :exercise_groups, :through => :registrations
  has_many :notices, :dependent => :destroy
  
  validates_length_of :username, :in => 3..20
  validates_length_of :password, :in => 3..20
  validates_length_of :first_name, :maximum=>30, :allow_blank=>true , :allow_nil=>true
  validates_length_of :surname, :maximum=>30, :allow_blank=>true , :allow_nil=>true
  validates_length_of :student_number, :maximum=>30, :allow_blank=>true , :allow_nil=>true
  validates_numericality_of :student_number, :only_integer =>true, :allow_blank=>true , :allow_nil=>true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank=>true , :allow_nil=>true
  validates_inclusion_of :account_type, :in => %w( Admin User )
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
