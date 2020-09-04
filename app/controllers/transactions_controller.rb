class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    if Address.find_by(user: current_user[:id]).present?
      @address = Address.find_by(user: current_user[:id])
    else
      @address = Address.new
    end
    @order = Order.new
  end

  def create
    @order = TradeOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:card_token, :tel, :postal_code, :prefecture_id, :city, :address, :building_name, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @charge = Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:card_token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || !@item.trade.nil?
  end
end
