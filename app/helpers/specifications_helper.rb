module SpecificationsHelper
  def find_inputfield(type, f, productspec)
    if productspec.value.nil?
      productspec.value = productspec.default
    end
    case type
  	when "Boolean" then
  		return f.select :value, ["Yes", "No"], {}, {:index => nil}
    when "Integer" then
  		return f.text_field :value, {:index => nil}
  	when "List" then
  	  collection = productspec.default.split(";")
  		return f.select :value, collection, {}, :index => nil
  	else
  		return f.text_field :value, {:index => nil}
  	end
  end
end