class Admin::HomesController < ApplicationController

  def top
    @order_history = Order.page(params[:page])
  end

end
