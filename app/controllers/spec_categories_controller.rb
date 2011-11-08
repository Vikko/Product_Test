class SpecCategoriesController < ApplicationController
  def index
    @spec_categories = SpecCategory.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @spec_categories }
    end
  end
  def show
    @spec_category = SpecCategory.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @spec_category }
    end
  end

  def new
    @spec_category = SpecCategory.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @spec_category }
    end
  end

  def edit
    @spec_category = SpecCategory.find(params[:id])
  end

  def create
    @spec_category = SpecCategory.new(params[:spec_category])

    respond_to do |format|
      if @spec_category.save
        format.html { redirect_to(@spec_category, :notice => 'Spec was successfully created.') }
        format.xml  { render :xml => @spec_category, :status => :created, :location => @spec_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spec_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @spec_category = SpecCategory.find(params[:id])

    respond_to do |format|
      if @spec_category.update_attributes(params[:spec_category])
        format.html { redirect_to(@spec_category, :notice => 'Spec was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spec_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @spec_category = SpecCategory.find(params[:id])
    @spec_category.destroy

    respond_to do |format|
      format.html { redirect_to(spec_categories_url) }
      format.xml  { head :ok }
    end
  end
end
