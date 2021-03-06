FactoryBot.define do
  factory :item do
    category_id              { '2' }
    condition_id             { '2' }
    shipping_charge_id       { '2' }
    prefecture_id            { '2' }
    days_to_ship_charge_id { '2' }
    name { 'カレンダー' }
    price                     { '1000' }
    description               { 'かわいいです' }
   
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      # after(:build) インスタンスがbuildされた後に指定の処理を実行できる
      # io: File.open ファイルを開く
    end
  end
end
