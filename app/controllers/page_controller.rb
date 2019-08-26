class PageController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def questions
  		flash[:notice] = "Page under construction"
		redirect_to root_url and return
  end

  def news
  		flash[:notice] = "Page under construction"
		redirect_to root_url and return
  end

  def contact
  		
  end
end
