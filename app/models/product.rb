class Product < ActiveRecord::Base
  has_many :product_specs, :dependent => :destroy
  has_many :specifications, :through => :product_specs
  belongs_to :product_type
  after_update :save_specs
  
  def spec_attributes=(spec_attributes)
    spec_attributes.each do |attributes|
      if attributes[:id].blank?
        product_specs.build(attributes)
      else
        product_spec = product_specs.detect { |s| s.id == attributes[:id].to_i }
        product_spec.attributes = attributes
      end
    end
  end
  
  def save_specs
    product_specs.each do |spec|
      if spec.should_destroy?
        spec.destroy
      else
        spec.save(false)
      end
    end
  end
end