class DefaultSpec < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :specification
  
  validates_presence_of :specification_id, :product_type_id  
    
  named_scope :product_type_id, lambda { |id| { :conditions => ['product_type_id == ?', id] } }
  named_scope :specification_id, lambda { |id| { :conditions => ['specification_id == ?', id] } }  
end
