class Registration < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :exercise_group

  after_create :update_newsfeed
  
  def update_newsfeed
    Newsfeed.join_exercise_group(self.user,self.exercise_group )
  end
end
