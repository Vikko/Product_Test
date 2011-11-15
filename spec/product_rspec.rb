require 'spec_helper'

describe Product do
  product = Factory.create(:product)
  it "should have name = Productname (factory test)" do
    product.name.should == "Productname"
  end
  
  it "should NOT have a type on creation" do
    product = Factory.create(:product)
    product.product_type.should be_nil
  end
  it "should be able to create product_specs" do
    product = Factory.create(:product)
    product.product_specs.create(:specification_id => 1, :value => "foo")
  end
end