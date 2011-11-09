class SpecificationsController < ApplicationController
  def index
    @specifications = Specification.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @specifications }
    end
  end
  def show
    @specification = Specification.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @specification }
    end
  end

  def new
    @specification = Specification.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @specification }
    end
  end

  def edit
    @specification = Specification.find(params[:id])
  end

  def create
    @specification = Specification.new(params[:specification])

    respond_to do |format|
      if @specification.save
        format.html { redirect_to(@specification, :notice => 'Specification was successfully created.') }
        format.xml  { render :xml => @specification, :status => :created, :location => @specification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @specification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @specification = Specification.find(params[:id])

    respond_to do |format|
      if @specification.update_attributes(params[:specification])
        format.html { redirect_to(@specification, :notice => 'Specification was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @specification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @specification = Specification.find(params[:id])
    @specification.destroy

    respond_to do |format|
      format.html { redirect_to(specs_url) }
      format.xml  { head :ok }
    end
  end
end
