FactoryBot.define do
  factory :trade_order do
    token { 'tok_df74c51dc61553b2893225a8e2ed' }
    tel {'08012345678'}
    postal_code { '163-8001' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '西新宿２丁目８−１' }
    building_name { '' }
    user_id { 2 }
    item_id { 4 }
  end
end