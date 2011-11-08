module ProductsHelper
  def add_product_spec_link(name) 
    link_to_function name do |page|
      ps = ProductSpec.new
  		page.insert_html :bottom, :specs, :partial => "product_spec", :object => ps
  	end
  end
end
