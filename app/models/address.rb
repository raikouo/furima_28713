class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  with_options presence: true do
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'ハイフン無しの数字10~11桁で入力して下さい' }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフン有りの数字7桁で入力して下さい' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択して下さい' }
    validates :city
    validates :address
  end
end
