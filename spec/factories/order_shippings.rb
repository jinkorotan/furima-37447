FactoryBot.define do
  factory :order_shipping do
    post_code  { '123-4567' }
    prefecture_id {  1 }
    municipality{ '横浜市' }
    address{ '1-1' }
    building_name{ '東京ハイツ' }
    phone_number{ '090-9806-1111' } 
  end
end
