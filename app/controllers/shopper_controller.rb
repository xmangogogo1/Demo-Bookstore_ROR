class ShopperController < ApplicationController
	include CurrentCart
	before_action :set_cart
	#before_action :set_product, only: [:show]

	skip_before_action :authorize
	
  #GET '/'
  def index
  	@products = Product.order(:name)   #will pass the instance variable products to the views under shopper controller
  end

  #GET '/shopper/:id'
  def show
  	@products = Product.find(params[:id]) 
  	#@products= parmas[:product]
  end

  

  # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

     # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image, :price)
    end

end
