FactoryBot.define do
  factory :item do
    name { 'フラッグ' }
    explain { 'フラッグの説明文です' }
    price { 1980 }
    status_id { 2 }
    postage_id { 2 }
    shipping_date_id { 2 }
    prefecture_id { 2 }
    category_id { 2 }
    association :user
  end
end
