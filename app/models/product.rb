class Product < ActiveRecord::Base
  has_many :product_specs, :dependent => :destroy
  has_many :specifications, :through => :product_specs
  belongs_to :product_type
  before_update :check_product_type_and_save_specs
  
  def spec_attributes=(spec_attributes)
    spec_attributes.each do |attributes|
      if attributes[:id].blank?
        product_specs.create(attributes)
      else
        product_spec = product_specs.detect { |s| s.id == attributes[:id].to_i }
        product_spec.attributes = attributes #Mass assign warning 
      end
    end
  end
  
  def add_default_specs_from_product_type #create new specs from default specs
    product_type.default_specs.each do |ds|
      unless specification_ids.include?ds.specification_id #doesnt exists
        product_specs.create(:specification_id => ds.specification_id, :required => ds.required?)
      end
    end
  end
  
  private
  
  def check_product_type_and_save_specs
    if product_type_id_changed?
      add_default_specs_from_product_type
    end
    product_specs.each do |ps|
      ds = product_type.default_specs.find_by_specification_id(ps.specification_id)
      if ds
        ps.required = ds.required?
      else
        ps.required = false
      end
      ps.save(false)
    end
  end
end