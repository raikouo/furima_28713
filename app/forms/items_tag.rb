class ItemsTag
  include ActiveModel::Model
  attr_accessor :tag_name, :name, :explain, :price, :image, :status_id, :postage_id, :shipping_date_id, :prefecture_id, :category_id, :user_id

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explain, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  validates :tag_name, format: {with: /\A\#.{1,10}\z/, message: 'は #◯◯◯の形で10文字以内で入力して下さい', allow_blank: true}

  with_options numericality: { other_than: 1, message: 'を選択して下さい' } do
    validates :status_id
    validates :postage_id
    validates :shipping_date_id
    validates :prefecture_id
    validates :category_id
  end

  def save
    item = Item.create(
      name: name,
       explain: explain,
       price: price,
       image: image,
       status_id: status_id,
       postage_id: postage_id,
       shipping_date_id: shipping_date_id,
       prefecture_id: prefecture_id,
       category_id: category_id,
       user_id: user_id
    )
    if tag_name != ""
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save

      ItemTagRelation.create(item_id:item.id, tag_id: tag.id)
    end
  end

end