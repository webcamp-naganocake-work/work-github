class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status: params[:order][:order_status])
    if @order.order_status == "confirmation"
      @order.order_details.update_all(making_status: 'pending')
    end
    redirect_to admin_order_path(@order.id)
  end

end
