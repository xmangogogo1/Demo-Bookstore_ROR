class Order < ApplicationRecord
	has_many :line_items, dependent: :destroy

	PAYMENT_TYPES = ["Debit Card", "Credit Card", "Venmo", "Paypal"] 

	validates :name, :address, :email, presence: true 
	validates :paytype, inclusion: PAYMENT_TYPES


# when place order, for this @order, find all the line_items entity underthis cart, 
# and made them belongs to the order table
	def add_items_from_cart(cart)
    	cart.line_items.each do |item|
      		item.cart_id = nil
      		item.order_id = self.id
    	end
	end
end
