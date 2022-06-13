FactoryBot.define do
  factory :user do
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.free_email}
      password              {Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      kanji_first_name      {'山田'}
      kanji_last_name       {'太郎'}
      kana_first_name       {'ヤマダ'}
      kana_last_name        {'タロウ'}
      birthday              {'2000/01/01'}
  end
end