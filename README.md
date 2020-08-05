# README

## Database creation
### users table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|street_id|integer|null: false, foreign_key: true|
|image|string||
|surname|string|null: false|
|surname_kana|string|null: false|
|firstname|string|null: false|
|firstname_kana|string|null: false|
|nick_name|string|null: false, unique: true|
|Birthday|string|null: false|
|mail|string|null: false|
|password|string|null: false|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- has_one :street
- has_many :items
- has_many :messages, through: :users_messages
- has_many :messages
- has_many :users_messages
- has_many :credits, through: :users_credits
- has_many :credits
- has_many :users_credits

### items table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|sell_user_id|integer|null: false, foreign_key: true|
|buy_user_id|integer|null: false, foreign_key: true|
|stage|integer|null: false|
|name|string|null: false|
|price|integer|null: false|
|item_detail|text||
|delivery_fee_detail|string|null: false|
|delivery_days|integer|null: false|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- has_many :item_images
- has_many :messages
- belongs_to :user
- has_many :categories, through: :items_categories
- has_many :categories
- has_many :items_categories

### streets table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|postal_code|string|null: false, limit: 7|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string|null: false, limit: 12|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- belongs_to :user

### credits table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|brand|string|null: false|
|card_number|string|null: false, limit: 16|
|expiration|string|null: false, limit: 5|
|secret_code|string|null: false, limit: 3|
|card_surname|string|null: false|
|card_firstname|string|null: false|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- has_many :users, through: :users_credits
- has_many :users
- has_many :users_credits

### categories table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|name|string|null: false|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- has_many :items, through: :items_categories
- has_many :items
- has_many :items_categories

### messages table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|item_id|integer|null: false, foreign_key: true|
|text|text||
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- belongs_to :item
- has_many :users, through: :users_messages
- has_many :users
- has_many :users_messages

### item_images table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|item_id|integer|null: false, foreign_key: true|
|image|string|null: false|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- belongs_to :item

### items_categories table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- belongs_to :item
- belongs_to :category

### users_credits table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|user_id|integer|null: false, foreign_key: true|
|credit_id|integer|null: false, foreign_key: true|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- belongs_to :user
- belongs_to :credit

### users_messages table
|Column|Type|Options|
|------|----|-------|
|id|integer|primary_key|
|user_id|integer|null: false, foreign_key: true|
|messages_id|integer|null: false, foreign_key: true|
|created_at|date|null: false|
|updated_at|date|null: false|

#### Association
- belongs_to :user
- belongs_to :message