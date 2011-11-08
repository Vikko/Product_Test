class ProductSpec < ActiveRecord::Base
  belongs_to :product
  belongs_to :spec
  attr_accessor :should_destroy
  validates_presence_of :value, :conditions => {'required = ?', true}
  
  def should_destroy?
    should_destroy.to_i == 1
  end
  
  def self.required?
      return required
  end
end
