# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

SpecCategory.create(:id => 1, :name => "Other")
SpecCategory.create(:id => 2, :name => "Afmetingen")
SpecCategory.create(:id => 3, :name => "Systeem")

Specification.create(:name => "Lengte", :spec_category_id => 2, :spec_type => 2)
Specification.create(:name => "Breedte", :spec_category_id => 2, :spec_type => 2)
Specification.create(:name => "Hoogte", :spec_category_id => 2, :spec_type => 2)
Specification.create(:name => "Gewicht", :spec_category_id => 2, :spec_type => 2)

Specification.create(:name => "Processortype", :spec_category_id => 3, :spec_type => 0)
Specification.create(:name => "Processorsnelheid", :spec_category_id => 3, :spec_type => 0)
Specification.create(:name => "Besturingssysteem", :spec_category_id => 3, :spec_type => 0)

ProductType.create(:name => "Mobiele telefoon")
ProductType.create(:name => "PDA")
ProductType.create(:name => "Notebook")