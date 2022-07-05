class MessagesController < ApplicationController

  hobo_model_controller

  auto_actions :all

  

  def index
    @nmessages = 15
    @last_ten_messages = Message.find_all_by_id_figliodi_msg(0, :limit => @nmessages )
  end


  def show
    @nmessages = 10
    @last_ten_messages = Message.find_all_by_id_figliodi_msg(0, :limit => @nmessages )
    @message = Message.find(params[:id])
  # #    hobo_show :this => Message.find(params[:id]) # , :include => [ :comments ])
  end
  
  # def index
  #   
  # #  @id_figliodi_msg == 0
  # end 
  
  private
    


end
