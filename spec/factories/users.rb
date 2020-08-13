 require 'i18n'
 I18n.locale = :ja

FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname {Faker::Games::Pokemon.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {gimei.last.kanji}
    last_name {gimei.first.kanji}
    first_name_kana {gimei.last.katakana}
    last_name_kana {gimei.first.katakana}
    birth_day {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end