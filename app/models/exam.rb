class Exam < ActiveRecord::Base
  belongs_to :course
  has_many :exam_registrations, :dependent => :destroy
  has_many :users, :through => :exam_registrations
  
  def take_part(user)
    if self.users.find_by_id(user.id)
      return
    end
    self.users<<user
  end
end
