class Newsfeed < ActiveRecord::Base
  has_many :newsfeed_likes, :dependent => :destroy
  has_many :users, :through => :newsfeed_likes
  
  default_scope :order => 'created_at DESC'
  
  named_scope :new_15, :limit =>15
  
  def like(user)
    if self.users.find_by_id(user.id)
      return
    end
    self.users<<user
  end
  
  
  
  def self.user_registered(user)
    self.create :message => "Käyttäjä "+ user.username + " rekisteröityi järjestelmään"
  end
    def self.course_added(course)
    self.create :message => "Uusi kurssi" +"<a href=\"courses\\" + course.id.to_s + "\">" + course.name + "</a>" + "lisättiin"
  end
  def self.join_exercise_group(user, exg)
    self.create :message => "Käyttäjä "+ user.username + " liittyi kurssin: "+ exg.course_instance.course.name + ":" + exg.course_instance.name + " harjoitusryhmään:"  +"<a href=\"courses\\1\\course_instances\\1\\exercise_groups\\" + exg.id.to_s + "\">" + exg.name + "</a>" 
  end  
end
