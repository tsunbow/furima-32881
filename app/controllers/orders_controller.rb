class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_user, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :area_id, :municipality, :house_number, :phone_number, :building_name).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token], purchase_id: params[:purchase_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def set_user
    if current_user.id == @item.user_id 
      unless @item.purchase.blank?
        redirect_to root_path
      end
   end
  end
end
