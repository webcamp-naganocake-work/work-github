class Public::OrdersController < ApplicationController

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)

    if params[:order][:address_option] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.addressee = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "2"
      @address = Address.find(params[:order][:address_select])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.addressee = @address.name
    elsif params[:order][:address_option] == "3"
      @order.postal_code = params[:order][:entry_postal_code]
      @order.address = params[:order][:entry_address]
      @order.addressee = params[:order][:entry_addressee]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.amount = cart_item.amount
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price_including_tax = cart_item.item.with_tax_price
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def new
    @order = Order.new
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:addressee,:total,:postage)
  end

end
