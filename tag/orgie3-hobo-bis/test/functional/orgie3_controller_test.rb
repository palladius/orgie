require 'test_helper'

	# $Id$
	# I was inspired by:
	# http://guides.rubyonrails.org/testing.html

class ApplicationControllerTest < ActionController::TestCase

  #tests application

  # test "should check every fixture for validity no matter what fixture or model by Carlesso" do
  #    flunk 'Do a good FOR cicle on every model and on every entry and assert its validity. Maybe print a small report of validity, like: \nContacts: 10/10\nUsers: 9/10\nSalutations:4/4\n...'
  #  end
  #[ City , Event, Goliard, User ]
  ApplicationHelper::ORGIE_MODELS.each { |modelname|
     test "POLYMORPHIC['#{modelname}'] valid fixture test" do
        #print yellow("Checking '#{modelname}'...\n")
        modelname.find(:all).each{ |x|
           #print yellow( "Checking the fixture #{modelname}('#{x}')..\n" )
           assert_valid(x)
       }
     end

#    test "#{modelname} polymorphic should get new" do
#      get :new
#      assert_response :success
#    end
#
#     test "should get index" do
#    get :index
#    if @user_session.can_read?("clients")
#      assert_response :success
#      assert_not_nil assigns(:clients)
#    else
#      assert_response 200
#    end
#  end
   } # end of iterator thru models


end
