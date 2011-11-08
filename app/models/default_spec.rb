class DefaultSpec < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :spec
  
  validates_presence_of :spec_id, :product_type_id  
    
  named_scope :product_type_id, lambda { |id| { :conditions => ['product_type_id == ?', id] } }
  named_scope :spec_id, lambda { |id| { :conditions => ['spec_id == ?', id] } }
  
  def self.required?(pt,sp)
    if s = self.product_type_id(pt).spec_id(sp).first
      return s.required?
    else
      false
    end
  end
  
  def spec_name
    self.spec.name
  end
end
