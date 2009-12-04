class Newsfeed < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  
  named_scope :new_15, :limit =>15
  def self.user_registered(user)
    self.create :message => "Käyttäjä "+ user.username + " rekisteröityi järjestelmään"
  end
    def self.course_added(course)
    self.create :message => "Uusi kurssi "+ course.name + " lisättiin"
  end
  def self.join_exercise_group(user, exg)
    self.create :message => "Käyttäjä "+ user.username + " liittyi kurssin: "+ exg.course_instance.course.name + ":" + exg.course_instance.name + " harjoitusryhmään:" + exg.name 
  end  
end
