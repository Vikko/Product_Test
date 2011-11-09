require 'spec_helper'

describe Product do
  it "should be creatable" do
    product = Product.new
    product.should be_kind_of Product
  end
  it "should NOT have a type on creation" do
    product = Product.new
    product.product_type.should be_nil
  end
  it "should have NO products with ID nil" do 
    lambda{ product = Product.find(nil)}.should raise_error(ActiveRecord::RecordNotFound)
  end
  
end