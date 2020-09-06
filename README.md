# README

# テーブル設計
https://app.lucidchart.com/documents/view/c8def7d8-f801-412f-b489-181692d3d06a

## users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| birth_day       | date       | null: false                    |

### Association
- has_many :items
- has_many :trades
- has_many :comments
- has_one  :card, dependent: :destroy
- has_one  :address, dependent: :destroy

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| explain          | text       | null: false                    |
| price            | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :status
- belongs_to_active_hash :postage
- belongs_to_active_hash :shipping_date
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to :user
- has_one_attached :image
- has_one :trade
- has_many :comments, dependent: :destroy
- has_many :item_tag_relations, dependent: :destroy
- has_many :tags, through: :item_tag_relations

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| tel             | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| trade           | references | null: false, foreign_key: true |

### Association

- belongs_to :trade
- belongs_to_active_hash :prefecture

## trades テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user
- belongs_to :item

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| comment         | text       | null: false                    |

### Association
- belongs_to :item
- belongs_to :user

## cards テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_token      | string     | null: false,                   |
| customer_token  | string     | null: false,                   |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| tel             | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :user, optional: true

## tags テーブル

| Column          | Type       | Options                                          |
| --------------- | ---------- | ------------------------------------------------ |
| tag_name        | string     | null: false, foreign_key: true, uniqueness: true |

### Association
- has_many :item_tag_relations
- has_many :items, through: :item_tag_relations


## item_tag_relations テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| item     | references | foreign_key: true |
| tag      | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :tag


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
