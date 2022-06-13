class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId_id'
  belongs_to :post, foreign_key: 'PostId_id'

  validates :AuthorId_id, :PostId_id, presence: true

  after_save do
    post.increment!(:Likes_Counter)
  end
end
