class Course < ActiveRecord::Base
  has_many :course_instances, :dependent => :destroy
  has_many :exams, :dependent => :destroy
  
  named_scope :up, :order =>"created_at DESC"
  named_scope :down, :order =>"created_at ASC"

  after_create :update_newsfeed
  
  def update_newsfeed
    Newsfeed.course_added(self)
  end
end
