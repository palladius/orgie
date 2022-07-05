class SiteController < ApplicationController
  
  include AuthenticatedSystem

   def index
     @title = "ORGIE Home (still not fully functional)" 
   end

   def about
     @title = "About Orgie"
   end

   def help
     @title = "Help with Orgie"
   end

   def contact_us
      @title = "Contact Riccardo"
   end

   def doc
     @title = "Some documentation"
   end

   def error
     @title = "Error page"
     @error_msg =  params[:msg] || "Error msg not defined, sorry."
   end

   def rss
     @title = 'In the future this will contain feedback'
   end
  
end
