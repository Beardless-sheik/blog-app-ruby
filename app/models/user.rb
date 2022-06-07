class User < ApplicationRecord
  has_many :comments, foreign_key: 'AuthorId_id', dependent: :destroy
  has_many :posts, foreign_key: 'AuthorId_id', dependent: :destroy
  has_many :likes, foreign_key: 'AuthorId_id', dependent: :destroy

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end