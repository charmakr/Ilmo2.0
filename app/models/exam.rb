class Exam < ActiveRecord::Base
  belongs_to :course
  has_many :exam_registrations, :dependent => :destroy
  has_many :users, :through => :exam_registrations
end
