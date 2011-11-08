class ProductTypesController < ApplicationController
  def index
    @product_types = ProductType.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @product_types }
    end
  end

  def show
    @product_type = ProductType.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @product_type }
    end
  end
  
  def new
    @product_type = ProductType.new
    @default_items_categorized = categorize(load_default_specs)
    @required_items_categorized = categorize(load_required_specs)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @product_type }
    end
  end
  
  def edit
    @product_type = ProductType.find(params[:id])
    @default_items_categorized = categorize(load_default_specs)
    @required_items_categorized = categorize(load_required_specs)
  end

  def create
    @product_type = ProductType.new(params[:product_type])
    id_to_specs(@product_type)

    respond_to do |format|
      if @product_type.save
        format.html { redirect_to(@product_type, :notice => 'Product type was successfully created.') }
        format.xml  { render :xml => @product_type, :status => :created, :location => @product_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @product_type = ProductType.find(params[:id])
    id_to_specs(@product_type)

    respond_to do |format|
      if @product_type.update_attributes(params[:product_type])
        format.html { redirect_to(@product_type, :notice => 'Product type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_type = ProductType.find(params[:id])
    @product_type.destroy

    respond_to do |format|
      format.html { redirect_to(product_types_url) }
      format.xml  { head :ok }
    end
  end
  
  def id_to_specs(product_type) #change the spec ID to the actual spec
    product_type.specs.each do |s|
      s = Spec.find(s)
    end
  end
  
  def load_default_specs
    defaults = []
    DefaultSpec.product_type_id(params[:id]).each do |ds|
      defaults << ds
    end
    return defaults
  end
  
  def load_required_specs
    defaults = load_default_specs
    required = []
    defaults.each do |default|
      if default.required?
        required << default
      end
    end
    return required
  end
  
  def categorize(defaultspecs)
    categories = []
    defaultspecs.each do |ds|
      categories << ds.spec.spec_category
    end
    categories.uniq!
    categorized = Hash.new
    if categories 
      categories.each do |cat|
        specs = []
        defaultspecs.each do |ds|
          if ds.spec.spec_category == cat
            specs << [ds.spec.name, ds.spec.id]
          end
        end
        categorized[cat.name] = specs
      end
    end
    return categorized
  end

  def add_default_specs
    add_defspecs = params[:defspecs].split(",")
    
    add_defspecs.each do |defspec|
      DefaultSpec.create(:product_type_id => params[:id], :spec_id => defspec, :required => false)
    end
    update_fields
  end
  
  def remove_default_specs
    rem_defspecs = params[:defspecs].split(",")
    rem_defspecs.each do |defspec|
      DefaultSpec.product_type_id(params[:id]).spec_id(defspec).first.destroy
    end
    update_fields
  end
  
  def add_required_specs
    add_required_specs = params[:reqspecs].split(",")
     add_required_specs.each do |reqspec|
       ds = DefaultSpec.product_type_id(params[:id]).spec_id(reqspec).first
       ds.required = true
       ds.save
     end
    update_fields
  end
  
  def remove_required_specs
    rem_required_specs = params[:reqspecs].split(",")
    rem_required_specs.each do |reqspec|
      ds = DefaultSpec.product_type_id(params[:id]).spec_id(reqspec).first
      ds.required = false
      ds.save
    end
    update_fields
  end
  
  def update_fields
    @default_items_categorized = categorize(load_default_specs)
    @required_items_categorized = categorize(load_required_specs)

    render :update do |page|
      page.replace_html 'defaultspecs', :partial => 'default_specs'
      page.replace_html 'required_defaultspecs', :partial => 'req_default_specs'
    end
  end
end
