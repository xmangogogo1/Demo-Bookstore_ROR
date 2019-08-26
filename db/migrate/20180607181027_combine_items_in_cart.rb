class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def change
  	#for each item in cart
  	Cart.all.each do |cart|
  		sums = cart.line_items.group(:product_id).sum(:quantity)
  		#for each group

  		sums.each do |product_id, quantity|
  			if quantity > 1

  				#remove all items
  				cart.line_items.where(product_id: product_id).delete_all

  				#replace with a new single item (a new line in line_items table build)
  				item = cart.line_items.build(product_id: product_id)

  				#set quantity
  				item.quantity = quantity
  				item.save!
  			end
  		end
  	end
  end
end
