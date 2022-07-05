class FrontController < ApplicationController

  hobo_controller

  def index; end

  def search
    if params[:query]
      site_search(params[:query])
    end
  end

  # RIC:
  def stats; end
  def about; end
end
