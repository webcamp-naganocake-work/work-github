class Admin::ItemsController < ApplicationController
  def index
   @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
    p "#######"
    p @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private
  def item_params
     params.require(:item).permit(:id,:name,:introduction,:price,:is_active,:genre_id,:image)
  end

end
