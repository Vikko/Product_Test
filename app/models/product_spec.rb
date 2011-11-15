class ProductSpec < ActiveRecord::Base
  belongs_to :product
  belongs_to :specification
  attr_accessor :should_destroy
  validates_presence_of :value, :on => :update, :conditions => {'required = ?', true}
  
  def should_destroy?
    should_destroy.to_i == 1
  end
  
  def spec_name
    return self.specification.name
  end
  
  def default
    if self.specification
      return self.specification.spec_default
    else
      return ""
    end
  end
end
