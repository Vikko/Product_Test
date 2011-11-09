class ProductsController < ApplicationController
  def index
    @products = Product.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @products }
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @product }
    end
  end
  
  def new
    @product = Product.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end
  
  def get_default_specs
    @product = Product.find(params[:id])
    collection = []
    unless params[:product_type_id].blank?
      @product_type = ProductType.find(params[:product_type_id])
      @product_type.default_specs.each do |ds|
        unless @product.specification_ids.include?ds.specification_id
          collection << @product.product_specs.create(:specification_id => ds.specification_id, :required => ds.required?)
        end
      end
    end
      
    render :update do |page|
      page.replace_html 'specs', :partial => 'product_spec', :collection => collection, :with => 'new=t;'
    end
    
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
