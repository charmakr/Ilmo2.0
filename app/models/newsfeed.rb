class Newsfeed < ActiveRecord::Base
  
  def self.user_registered(user)
    self.create :message => "Käyttäjä "+ user.username + " rekisteröityi järjestelmään"
  end
    def self.course_added(course)
    self.create :message => "Uusi kurssi "+ course.name + " lisättiin"
  end
end
