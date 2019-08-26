class AccessController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize
 
#GET /login
  def new
  	 if session[:user_id]
      	redirect_to admin_url, notice: "already logged on"
		    return 
	   end
  end


#POST /login
#admin login
  def create
  	user = User.find_by(name: params[:name])
    
    # Verify user exists in db and run has_secure_password's .authenticate() 
    # method to see if the password submitted on the login form was correct: 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
	  else
      redirect_to login_url, alert: "Invalid user/password combination --- Please remove the before_action to add new user to login"
    end
  end


#POST /logout
  def destroy
  	session[:user_id] = nil
    redirect_to shopper_url, notice: "Logged out"
  end
  
end
