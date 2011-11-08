class SpecCategory < ActiveRecord::Base
  has_many :specs
  
  def default_specs
    self.specs.first.default_specs
  end
end
