class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name               , null: false
      t.text       :description        , null: false
      t.string     :category_id        , null: false
      t.integer    :price              , null: false
      t.string     :condition_id       , null: false
      t.string     :shipping_charge_id , null: false
      t.string     :prefecture_id      , null: false
      t.string     :days_to_ship_id    , null: false
      t.references :user               , null: false
     end
  end
end