# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false  unique: true |
| encrypted_password | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one :address

## items テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| item_name      | string      | null: false                    |
| text           | text        | null: false                    |
| category_id      | integer      | null: false                    |
| condition_id | integer      | null: false                    |
| cost_id  | integer      | null: false                    |
| area_id  | integer      | null: false                    |
| date_id  | integer      | null: false                    |
| price          | integer      | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases
- has_one :address

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| house_number | string     | null: false                    |
| phone_number | string    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchases

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :addres