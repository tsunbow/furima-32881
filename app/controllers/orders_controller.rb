class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
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
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
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
end
