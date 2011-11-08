ActionController::Routing::Routes.draw do |map|
  map.resources :products, :specs, :spec_categories, :product_specs, :product_types

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :controller => "products", :action => "index"
end
