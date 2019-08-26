class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  
  belongs_to :order, optional: true  
  # line_items table as a parent table the entity in this table must exist so that
  # to create children table(ex. with order_id #1 must exist in line_item table first to create an order entity by the order_id #1 in order table )
  
  def total_price
  	product.price * quantity
  end
end
