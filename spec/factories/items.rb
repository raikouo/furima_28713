FactoryBot.define do
  factory :item do
    name {Faker::Games::Pokemon.name}
    explain {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    status_id {Faker::Number.within(range: 2..7)}
    postage_id {Faker::Number.within(range: 2..3)}
    shipping_date_id {Faker::Number.within(range: 2..4)}
    prefecture_id {Faker::Number.within(range: 2..48)}
    category_id {Faker::Number.within(range: 2..11)}
    association :user
  end
end