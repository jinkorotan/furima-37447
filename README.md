# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| kanji_first_name   | string | null: false |
| kanji_last_name    | string | null: false |
| kana_first_name    | string | null: false |
| kanji_first_name   | string | null: false |
| kana_ last_name    | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

 Column                 | Type   | Options     |
| ------------------    | ------ | ----------- |
| item_image            | text   | null: false |
| item_name             | string | null: false |
| item_description      | string | null: false |
| item_condition        | string | null: false |
| item_shipping_charge  | string | null: false |
| item_shipping_address | string | null: false |
| kana_first_name       | string | null: false |
| item_days_to_ship     | string | null: false |
| item_sales_profit     | string | null: false |


### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| buyer      | string     | null: false                    |
| payment    | integer    | null: false                    |
| items_id   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| delivery address       | string     | null: false                    |
| post code              | string     | null: false                    |
| prefectures            | string     | null: false                    |
| municipality           | string     | null: false                    |
| order_shipping_address | string     | null: false                    |
| building name          | string     |                                |
| phone number           | string     | null: false                    |
| items_id               | references | null: false, foreign_key: true |
| orders_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :order

