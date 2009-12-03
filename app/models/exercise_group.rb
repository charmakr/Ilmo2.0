class ExerciseGroup < ActiveRecord::Base
  belongs_to :course_instance
  
  has_many :registrations, :dependent => true
  has_many :users, :through => :registrations

end
