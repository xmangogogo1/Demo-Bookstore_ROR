class ApplicationController < ActionController::Base
	before_action :authorize
  
  	# Prevent CSRF (Cross-site request forgery)attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

	def authorize
		unless User.find_by(id: session[:user_id])
      		redirect_to login_url, notice: "Please log in"
    	end
	end

	# You want to get exceptions in development, but not in production.
    unless Rails.application.config.consider_all_requests_local
    	rescue_from ActionController::RoutingError, with: -> { render_404  }
  	end

  	def render_404
    	respond_to do |format|
      		format.html { render template: 'errors/not_found', status: 404 }
      		format.all { render nothing: true, status: 404 }
    	end
  	end

end
