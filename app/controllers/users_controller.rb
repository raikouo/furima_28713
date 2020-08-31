class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @results = Item.where(user_id: current_user).order(id: 'desc' )
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render "show"
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
