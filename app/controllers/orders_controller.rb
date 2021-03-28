class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end

  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :area_id, :municipality, :house_number, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
