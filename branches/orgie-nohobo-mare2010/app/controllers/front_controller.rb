class FrontController < ApplicationController

  #hobo_controller

  def index
    @last_five_messages = Message.find_all_by_id_figliodi_msg(0, :limit => 6 )
  end

  def stats
  end

  def search
    if params[:query]
      site_search(params[:query])
    end
  end

end
