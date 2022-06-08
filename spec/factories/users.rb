FactoryBot.define do
  factory :user do
      nickname              {'test'}
      email                 {'test@example'}
      password              {'000000'}
      password_confirmation {password}
      kanji_first_name{'test'}
      kanji_last_name{'test'}
      kana_first_name{'test'}
      kana_last_name{'test'}
      birthday{'test'}

  end
end