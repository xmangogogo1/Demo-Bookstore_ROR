class ErrorsController < ApplicationController
 include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def error_404
    render 'errors/not_found'
  end
end