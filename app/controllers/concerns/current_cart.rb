module CurrentCart
	extend ActiveSupport::Concern

	def set_cart 
	#check if the session for a certain cart exists or not, if it does, get this cart from cart table
	#if not, create a new cart and save it in session
		@cart = Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart.id
		@cart
	end
end
