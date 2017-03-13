class OilBenefit < ActiveRecord::Base
  belongs_to :oil 
  belongs_to :benefit 
end
