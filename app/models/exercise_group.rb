class ExerciseGroup < ActiveRecord::Base
  belongs_to :course_instance
  
  has_many :registrations
  has_many :users, :through => :registrations
  
  def join(user)
    if self.users.find_by_id(user.id)
      return
    end
    self.users<<user 
  end

end
