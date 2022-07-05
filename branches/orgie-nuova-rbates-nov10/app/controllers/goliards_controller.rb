class GoliardsController < ApplicationController
  def index
    @goliards = Goliards.all
  end
  
  def show
    @goliards = Goliards.find(params[:id])
  end
  
  def new
    @goliards = Goliards.new
  end
  
  def create
    @goliards = Goliards.new(params[:goliards])
    if @goliards.save
      flash[:notice] = "Successfully created goliards."
      redirect_to @goliards
    else
      render :action => 'new'
    end
  end
  
  def edit
    @goliards = Goliards.find(params[:id])
  end
  
  def update
    @goliards = Goliards.find(params[:id])
    if @goliards.update_attributes(params[:goliards])
      flash[:notice] = "Successfully updated goliards."
      redirect_to @goliards
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @goliards = Goliards.find(params[:id])
    @goliards.destroy
    flash[:notice] = "Successfully destroyed goliards."
    redirect_to goliards_url
  end
end
