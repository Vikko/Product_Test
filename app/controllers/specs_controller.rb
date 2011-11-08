class SpecsController < ApplicationController
  def index
    @specs = Spec.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @specs }
    end
  end
  def show
    @spec = Spec.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @spec }
    end
  end

  def new
    @spec = Spec.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @spec }
    end
  end

  def edit
    @spec = Spec.find(params[:id])
  end

  def create
    @spec = Spec.new(params[:spec])

    respond_to do |format|
      if @spec.save
        format.html { redirect_to(@spec, :notice => 'Spec was successfully created.') }
        format.xml  { render :xml => @spec, :status => :created, :location => @spec }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @spec = Spec.find(params[:id])

    respond_to do |format|
      if @spec.update_attributes(params[:spec])
        format.html { redirect_to(@spec, :notice => 'Spec was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @spec = Spec.find(params[:id])
    @spec.destroy

    respond_to do |format|
      format.html { redirect_to(specs_url) }
      format.xml  { head :ok }
    end
  end
end
