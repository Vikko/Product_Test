class SpecCategory < ActiveRecord::Base
  has_many :specifications
  
  def default_specs
    self.specifications.first.default_specs
  end
end
