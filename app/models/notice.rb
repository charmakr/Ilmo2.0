class Notice < ActiveRecord::Base
  belongs_to :user
  
  validate_on_create :check_user
  
  
  def check_user
    if (self.user.account_type!="Admin")
      errors.add("Admin required")
      return false
    end  
  end
end
