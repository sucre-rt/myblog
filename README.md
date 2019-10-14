# README

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

# myblog DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
has_many :articles

## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|image|text||
|text|text||
|user|references|foreign_key: true|
### Association
belongs_to :user