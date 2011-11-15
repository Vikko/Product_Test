class ProductsController < ApplicationController
  before_filter :get_product, :only => [:show, :remove_product_spec, :add_product_spec_link, :edit, :update, :destroy]
  
  def get_product
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @products }
    end
  end

  def show
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
  
  def add_product_spec_link
    ProductSpec.create(:product_id => params[:id])
    render :edit
  end

  def edit
  end
  
  def remove_product_spec
    @productspec = ProductSpec.find(params[:product_spec_id])
    @productspec.destroy
    render :edit
  end

  def create
    @product = Product.create(params[:product])

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
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html do
          flash[:notice] = "Product was successfully updated!"
          render :action => "edit"
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
