class FacultiesController < ApplicationController
  
  def index
    @faculties = Faculty.all
  end
  
  def show
    @faculty = Faculty.find(params[:id])
  end
  
  def new
    @faculty = Faculty.new
  end
  
  def create
    @faculty = Faculty.new(params[:faculty])
    if @faculty.save
      flash[:notice] = "Successfully created Facolta."
      redirect_to @faculty
    else
      render :action => 'new'
    end
  end
  
  def edit
    @faculty = Faculty.find(params[:id])
  end
  
  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update_attributes(params[:faculty])
      flash[:notice] = "Successfully updated Facolta."
      redirect_to @faculty
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy
    flash[:notice] = "Successfully destroyed Facolta."
    redirect_to faculties_url
  end

end
