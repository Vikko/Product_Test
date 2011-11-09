module SpecificationsHelper
  def find_inputfield(type, f, productspec)
    case type
  	when "Boolean" then
  		return f.check_box :value, :index => nil
    when "Integer" then
  		return f.text_field :value, :index => nil
  	when "List" then
  	  collection = productspec.specification.spec_default.split(";")
  		return f.select :value, collection, {}, :index => nil
  	else
  		return f.text_field :value, :index => nil
  	end
  end
end