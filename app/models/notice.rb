class Notice < ActiveRecord::Base
  belongs_to :user
  
  validate_on_create :check_user
  
  
  def check_user
    if (self.user.account_type!="Admin")
      errors.add_to_base("Admin required")
    end  
  end
end
