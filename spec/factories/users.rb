FactoryBot.define do
  factory :user do
    nickname {Faker::Games::Pokemon.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {Gimei.last.kanji}
    last_name {Gimei.first.kanji}
    first_name_kana {Gimei.last.katakana}
    last_name_kana {Gimei.first.katakana}
    birth_day {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end