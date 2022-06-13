class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId_id'
  belongs_to :post, foreign_key: 'PostId_id'

  validates :text, :AuthorId_id, :PostId_id, presence: true

  after_save do
    post.increment!(:Comments_Counter)
  end
end
