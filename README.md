# テーブル設計

## users テーブル

| Column                  | Type    | Options     |
| ------------------------| ------- | ----------- |
| nickname                | string  | null: false |
| email                   | string  | null: false |
| encrypted_password      | string  | null: false |
| last_name               | string  | null: false |
| first_name              | string  | null: false |
| last_name_kana          | string  | null: false |
| first_name_kana          | string  | null: false |
| birthday                | date    | null: false |



### Association

- has_many :products
- has_one :address

## products テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| product_category       | string     | null: false                    |
| product_status         | string     | null: false                    |
| shipping_charges       | string     | null: false                    |
| delivery_area          | string     | null: false                    |
| days_to_ship           | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one    :buy

## buys テーブル


| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| card_information       | integer    | null: false                    |
| expiration_month       | integer    | null: false                    |
| expiration_year        | integer    | null: false                    |
| security_code          | integer    | null: false                    |
| product                | references | null: false, foreign_key: true |
| address                | references | null: false, foreign_key: true |


### Association
- belongs_to :product
- belongs_to :address


## addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| shipping_postal_code   | string     | null: false                    |
| delivery_area          | string     | null: false                    |
| shipping_municipality  | string     | null: false                    |
| shipping_address       | string     | null: false                    |
| shipping_building_name | string     |                                |
| phone_number           | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |
| buy                    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buy
