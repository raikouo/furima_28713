# README

# テーブル設計
https://app.lucidchart.com/documents/view/c8def7d8-f801-412f-b489-181692d3d06a

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_one :profiles

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explain         | text       | null: false                    |
| status          | string     | null: false                    |
| postage         | string     | null: false                    |
| shipping_date   | string     | null: false                    |
| price           | integer    | null: false                    |
| users_id        | references | null: false, foreign_key: true |
| prefecture_id   | references | null: false, foreign_key: true |
| categories_id   | references | null: false, foreign_key: true |

### Association

- has_many :images
- has_one :orders
- belongs_to :users
- belongs_to :prefectures
- belongs_to :categories

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| tel             | string     | null: false                    |
| postal_code     | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| users_id        | references | null: false, foreign_key: true |
| prefecture_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
- belongs_to :prefectures

## profiles テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| birth_year      | integer    | null: false                    |
| birth_month     | integer    | null: false                    |
| birth_date      | integer    | null: false                    |
| users_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :users

## prefectures テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

### Association

- has_many :items
- has_many :orders

## categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

### Association

- has_many :items

## images テーブル

| Column   | Type       | Options                        |
| -------- | -----------| ------------------------------ |
| items_id | references | null: false, foreign_key: true |

### Association

- belongs_to :items




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
