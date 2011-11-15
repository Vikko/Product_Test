class Specification < ActiveRecord::Base
  has_many :product_specs, :dependent => :destroy
  has_many :products, :through => :product_specs
  
  has_many :default_specs, :dependent => :destroy
  has_many :product_types, :through => :default_specs
  
  belongs_to :spec_category
  
  named_scope :not_attached_with, lambda{ |product| return {} unless product.specification_ids.any?; {:conditions => ["id NOT IN (?)", product.specification_ids]} }
  
  
  TYPES = {
    0 => "String",
    1 => "Boolean",
    2 => "Integer",
    3 => "List"
  }
  
  def type
    TYPES[self.spec_type]
  end
end
