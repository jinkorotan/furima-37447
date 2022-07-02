class OrderShipping
  include ActiveModel::Model
  attr_accessor :user, :prefecture,:post_code,:prefecture_id,:municipality,:municipality,:address,:building_name,:phone_number,:order

  #ここにorderとshippingのバリデーションをまとめる--------------------------------------

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
end

 
  
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,  message: "is invalid. Include hyphen(-)"}

#電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと
    validates :phone_number, format: { \A0[789]0[-]?\d{4}[-]?\d{4}\z,message: "can't be blank"}

 #ここにorderとshippingのバリデーションをまとめる--------------------------------------


  def save
    # 各テーブルにデータを保存する処理を書く
    # 購入情報を保存し、記録に関するテーブルへ（誰がいつどの商品を購入したのか記録する）
   
      Order.create(user: user, item: item)
    # 配送先を住所情報に関するテーブルへ保存する
    
      Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address,  building_name: building_name,phone_number: phone_number,order: order)

  end
end