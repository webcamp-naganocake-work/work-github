class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(making_status: params[:order_detail][:making_status])
    if @order_detail.making_status == "making"
      @order_detail.order.update(order_status: 'making')
    end
    if @order.order_details.count == @order.order_details.where(making_status: "completed").count
      @order_detail.order.update(order_status: 'preparing')
    end
    redirect_to admin_order_path(@order.id)
  end

end