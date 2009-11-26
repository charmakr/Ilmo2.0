class Course < ActiveRecord::Base
  has_many :course_instances, :dependent => :destroy
  
  named_scope :up, :order =>"created_at DESC"
  named_scope :down, :order =>"created_at ASC"


end
