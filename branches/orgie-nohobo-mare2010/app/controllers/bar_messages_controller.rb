class BarMessagesController < ApplicationController
  # GET /bar_messages
  # GET /bar_messages.xml
  def index
    @bar_messages = BarMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bar_messages }
    end
  end

  # GET /bar_messages/1
  # GET /bar_messages/1.xml
  def show
    @bar_message = BarMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bar_message }
    end
  end

  # GET /bar_messages/new
  # GET /bar_messages/new.xml
  def new
    @bar_message = BarMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bar_message }
    end
  end

  # GET /bar_messages/1/edit
  def edit
    @bar_message = BarMessage.find(params[:id])
  end

  # POST /bar_messages
  # POST /bar_messages.xml
  def create
    @bar_message = BarMessage.new(params[:bar_message])

    respond_to do |format|
      if @bar_message.save
        flash[:notice] = 'BarMessage was successfully created.'
        format.html { redirect_to(@bar_message) }
        format.xml  { render :xml => @bar_message, :status => :created, :location => @bar_message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bar_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bar_messages/1
  # PUT /bar_messages/1.xml
  def update
    @bar_message = BarMessage.find(params[:id])

    respond_to do |format|
      if @bar_message.update_attributes(params[:bar_message])
        flash[:notice] = 'BarMessage was successfully updated.'
        format.html { redirect_to(@bar_message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bar_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bar_messages/1
  # DELETE /bar_messages/1.xml
  def destroy
    @bar_message = BarMessage.find(params[:id])
    @bar_message.destroy

    respond_to do |format|
      format.html { redirect_to(bar_messages_url) }
      format.xml  { head :ok }
    end
  end
end
