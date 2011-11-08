class ProductType < ActiveRecord::Base
  has_many :products
  
  has_many :default_specs, :dependent => :destroy
  has_many :specs, :through => :default_specs  
end
