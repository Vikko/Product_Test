class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  def categorize_specs(specs)
    categories = []
    specs.each do |spec|
      categories << spec.spec_category
    end
    categories.uniq!
    categorized = Hash.new
    if categories 
      categories.each do |cat|
        cat_specs = []
        specs.each do |spec|
          if spec.spec_category == cat
            cat_specs << [spec.name, spec.id]
          end
        end
        categorized[cat.name] = cat_specs
      end
    end
    return categorized
  end

end
