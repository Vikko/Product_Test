class ProductSpec < ActiveRecord::Base
  belongs_to :product
  belongs_to :specification
  attr_accessor :should_destroy
  validates_presence_of :value, :on => :update, :conditions => {'required = ?', true}
  
  def should_destroy?
    should_destroy.to_i == 1
  end
end
