class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :item_name, :text, :category_id, :condition_id, :cost_id, :area_id, :date_id, :price)
  end

end
