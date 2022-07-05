class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  # GET /cacchio_posts
  # GET /cacchio_posts.xml
  def index
    @cacchio_posts = CacchioPost.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cacchio_posts }
    end
  end

  # GET /cacchio_posts/1
  # GET /cacchio_posts/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /cacchio_posts/new
  # GET /cacchio_posts/new.xml
#  def new
#    @user = CacchioPost.new
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @cacchio_post }
#    end
#  end


  def edit
    @user = User.find(params[:id])
  end



  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cacchio_posts/1
  # DELETE /cacchio_posts/1.xml
  def destroy
    @cacchio_post = User.find(params[:id])
    @cacchio_post.destroy

    respond_to do |format|
      format.html { redirect_to(cacchio_posts_url) }
      format.xml  { head :ok }
    end
  end
end
