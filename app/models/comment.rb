class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  with_options presence: true do
    validates :item
    validates :user
    validates :comment, length: { maximum: 200 }
  end
end
