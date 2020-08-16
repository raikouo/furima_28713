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
    validates :name
    validates :explain
    validates :price
    validates :image
  end
  
  with_options numericality: { other_than: 1 }  do
    validates :status_id
    validates :postage_id
    validates :shipping_date_id
    validates :prefecture_id
    validates :category_id
  end
end
