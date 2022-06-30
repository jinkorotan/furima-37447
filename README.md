# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -------------------------|
| nickname           | string | null: false              |
| email              | string | null: false,unique:true  |
| encrypted_password | string | null: false              |
| kanji_first_name   | string | null: false              |
| kanji_last_name    | string | null: false              |
| kana_first_name    | string | null: false              |
| kana_last_name     | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル  

 Column                    | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| price                    | integer    | null: false                    |
| description        　　　 | text       | null: false                    |
| category_id        　　　 | integer    | null: false                    |
| condition_id       　　　 | integer    | null: false                    |
| shipping_charge_id  　　　| integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| days_to_ship_charge_id    　　　 | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one : shipping


## cs テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| post_code              | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| municipality           | string     | null: false                    |
| address 　　　　　　　　　| string     | null: false                    |
| building_name          | string     |                                |
| phone_number           | string     | null: false                    |
| order                  | references | null: false, foreign_key: true |

### Association

- belongs_to :order



