class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId_id'
  belongs_to :post, foreign_key: 'PostId_id'

  after_save do
    post.increment!(:Comments_Counter)
  end
end