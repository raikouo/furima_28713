class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explain, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :postage_id
    validates :shipping_date_id
    validates :prefecture_id
    validates :category_id
  end
end
