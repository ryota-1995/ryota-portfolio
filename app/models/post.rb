class Post < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  validates :content, { presence: true }
end
