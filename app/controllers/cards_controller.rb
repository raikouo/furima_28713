class CardsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:card_token]
    )
    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )
    if card.valid?
      card.save
      redirect_to root_path
    else
      redirect_to new_card_path
    end
  end
end
