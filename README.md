#テーブル設計

##users table

| column             | Type      | Options       |
| ------------------ | --------- | ------------- |
| name               | string    | null: false   |
| email              | string    | null: false   |
| encrypted_password | string    | null: false   |

###Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

##rooms table

| column             | Type      | Options       |
| ------------------ | --------- | ------------- |
| name               | string    | null:false    |

###Association

- has_many :room_users
- has_many :users, through: :rooms_users
- has_many messages

##room_users table

| column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null:false, foreign_key: true |
| room               | references | null:false, foreign_key: true |

###Association

- belongs_to :user
- belongs_to :room

##messages table

| column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| content            | string     |                               |
| user               | references | null:false, foreign_key: true |
| room               | references | null:false, foreign_key: true |

###Association

- belongs_to :user
- belongs_to :room