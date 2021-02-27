# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| last_name      | string  | null: false |
| first_name     | string  | null: false |
| year_of_birth  | integer | null: false |
| month_of_birth | integer | null: false |
| day_of_birth   | integer | null: false |


### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| image                  |            | null: false                    |
| product_name           | string     | null: false                    |
| product_description    | string     | null: false                    |
| product_category       | string     | null: false                    |
| product_status         | string     | null: false                    |
| shipping_charges       | string     | null: false                    |
| delivery_area          | string     | null: false                    |
| days_to_ship           | string     | null: false                    |
| price                  | integer    | null: false                    |
| whether_or_not_to_sell | boolean    | null: false                    |
| user                   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :purchase

## purchase テーブル


| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| card_information       | integer    | null: false                    |
| expiration_month       | integer    | null: false                    |
| expiration_year        | integer    | null: false                    |
| security_code          | integer    | null: false                    |
| shipping_postal_code   | string     | null: false                    |
| shipping_prefectures   | string     | null: false                    |
| shipping_municipality  | string     | null: false                    |
| shipping_address       | string     | null: false                    |
| shipping_building_name | string     | null: true                     |
| phone_number           | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| product                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
