class GoliardsController < ApplicationController
  def index
    @goliards = Goliard.all
  end
  
  def show
    @goliard = Goliard.find(params[:id])
  end
  
  def new
    @goliard = Goliard.new
  end
  
  def create
    @goliard = Goliard.new(params[:goliard])
    if @goliard.save
      flash[:notice] = "Successfully created goliard."
      redirect_to @goliard
    else
      render :action => 'new'
    end
  end
  
  def edit
    @goliard = Goliard.find(params[:id])
  end
  
  def update
    @goliard = Goliard.find(params[:id])
    if @goliard.update_attributes(params[:goliard])
      flash[:notice] = "Successfully updated goliard."
      redirect_to @goliard
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @goliard = Goliard.find(params[:id])
    @goliard.destroy
    flash[:notice] = "Successfully destroyed goliard."
    redirect_to goliards_url
  end
end
