class Amount < ActiveRecord::Base
    
  def default_amount
    self.amount ||= 1000
  end
  
end
