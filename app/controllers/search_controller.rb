class SearchController < ApplicationController
  include CurrentCart
  before_action :set_cart, :find_products

  skip_before_action :authorize

  # GET /search
  def index	
	#if nothing matches in database 
 	if @products.blank?
		flash[:notice] = "Results regrads your seach #{params[:keyword]} is empty"
		redirect_to root_url and return
  	end

  rescue ## if run a empty search(empty in any of the search text filed), same as #if @products.nil?
	flash[:notice] = "Sorry, searching not suceess, please try again"
	redirect_to root_url and return
  end


  private

  def find_products
  	if params[:keyword].presence
  		if params[:from].presence || params[:to].presence
  			@products = Product.where("lower(name) LIKE ? OR lower(description) LIKE ? AND price BETWEEN ? AND ?", 
  					"%#{params[:keyword].downcase}%", "%#{params[:keyword].downcase}%", "%#{params[:from]}%","%#{params[:to]}%").order('price')
  		else
  			# use .presence or .present? -- because the params come from forms might be empty (or whitespaced) strings 
  			@products = Product.where('lower(name) LIKE ? OR lower(description) LIKE ?', "%#{params[:keyword].downcase}%", "%#{params[:keyword].downcase}%").order('price')
  		end
  	end
  end

end
