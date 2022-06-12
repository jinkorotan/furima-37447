FactoryBot.define do
  factory :user do
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.free_email}
      password              {Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      kanji_first_name      {Faker::Name.first_name}
      kanji_last_name       {Faker::Name.last_name}
      kana_first_name       {'ヤマダ'}
      kana_last_name        {'タロウ'}
      birthday              {'2000/01/01'}
  end
end