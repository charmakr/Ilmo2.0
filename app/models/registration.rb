class Registration < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :exercise_group


  validate_on_create :check_participant_count
  after_create :update_newsfeed
  
  def check_participant_count
    if(self.exercise_group.users.size>=self.exercise_group.max_registrations)
       errors.add("Too many participants")
      return false
    end
  end
  
  def update_newsfeed
    Newsfeed.join_exercise_group(self.user,self.exercise_group )
  end
end
