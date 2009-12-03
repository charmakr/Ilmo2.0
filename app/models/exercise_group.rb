class ExerciseGroup < ActiveRecord::Base
  belongs_to :course_instance
  
  has_many :registrations
  has_many :users, :through => :registrations
  
  validate :check
  
  def check
    if(self.course_instance.max<=self.course_instance.exercise_groups.size) 
      errors.add_to_base("Liikaa ryhmiä")
    end
  end
  
  
  def join(user)
    if self.users.find_by_id(user.id)
      return
    end
    if(self.course_instance.multiple_exercise_groups==false)
      self.course_instance.exercise_groups.each  do |ex|
        if ex.users.find_by_id(user.id)
          return
        end
      end
    end
    self.users<<user 
  end

end
