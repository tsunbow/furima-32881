class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
       @item = Item.find(params[:id])
       @item.save
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  

  def item_params
    params.require(:item).permit(:image, :item_name, :text, :category_id, :condition_id, :cost_id, :area_id, :datee_id,
                                 :price).merge(user_id: current_user.id)
  end
end
