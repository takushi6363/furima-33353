# テーブル設計

## users テーブル

| Column                  | Type    | Options                  |
| ------------------------| ------- | ------------------------ |
| nickname                | string  | null: false              |
| email                   | string  | null: false, unique: true|
| encrypted_password      | string  | null: false              |
| last_name               | string  | null: false              |
| first_name              | string  | null: false              |
| last_name_kana          | string  | null: false              |
| first_name_kana         | string  | null: false              |
| birthday                | date    | null: false              |

### Association

- has_many :products
- has_many :buys


## products テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| product_category_id    | integer    | null: false                    |
| product_status_id      | integer    | null: false                    |
| shipping_charges_id    | integer    | null: false                    |
| delivery_area_id       | integer    | null: false                    |
| days_to_ship_id        | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :buy


## buys テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product                | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |

### Association
- belongs_to :product
- belongs_to :user
- has_one    :address



## addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| shipping_postal_code   | string     | null: false                    |
| delivery_area_id       | integer    | null: false                    |
| shipping_municipality  | string     | null: false                    |
| shipping_address       | string     | null: false                    |
| shipping_building_name | string     |                                |
| phone_number           | string     | null: false                    |
| buy                    | references | null: false, foreign_key: true |

### Association
- belongs_to :buy
