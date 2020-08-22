class TradeOrder
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :trade_id, :tel, :postal_code, :prefecture_id, :city, :address, :building_name

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :tel, format: { with: /\A\d{10,11}\z/, message: "ハイフン無しの数字10~11桁で入力して下さい" }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "ハイフン有りの数字7桁で入力して下さい" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
  end

  def save
    trade = Trade.create(
      user_id: user_id,
      item_id: item_id
    )

    Order.create(
      trade_id: trade.id,
      tel: tel,
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building_name: building_name
    )
  end
end