FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6,mix_case: false) }
    password_confirmation { password }
    kanji_first_name      {'山田' }
    kanji_last_name       {'太郎' }
    kana_first_name       {'ヤマダ'}
    kana_last_name        {'タロウ'}
    birthday              { Faker::Date.birthday }
  end
end
