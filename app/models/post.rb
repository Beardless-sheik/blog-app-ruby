class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId_id'

  has_many :comments, dependent: :destroy, foreign_key: 'PostId_id'
  has_many :likes, dependent: :destroy, foreign_key: 'PostId_id'
end