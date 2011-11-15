Factory.define :default_spec do |ds|
  ds.association :product_type
  ds.association :specification
  ds.required true
end

Factory.define :product do |pr|
  pr.name "Productname"
  pr.brand "Merk"
  pr.price 200
  pr.created_at {1.hour.ago}  
  pr.updated_at {10.minutes.ago}
end

Factory.define :product_spec do |ps|
  ps.sequence(:specification_id) {|n| n}
  ps.value "Input value"
  ps.product_id 1
  ps.created_at {1.hour.ago}  
  ps.updated_at {10.minutes.ago}
  ps.required true
end

Factory.define :product_type do |pt|
  pt.name "Product Type"
  pt.created_at {1.hour.ago}  
  pt.updated_at {10.minutes.ago}
end

Factory.define :spec_category do |sc|
  sc.name "Afmetingen"
  sc.created_at {1.hour.ago}  
  sc.updated_at {10.minutes.ago}
end

Factory.define :specification do |sp|
  sp.name "Lengte"
  sp.created_at {1.hour.ago}  
  sp.updated_at {10.minutes.ago}
  sp.association :spec_category
  sp.spec_type "String"
  sp.spec_default "100"
end