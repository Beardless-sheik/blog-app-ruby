class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId_id'

  has_many :comments, dependent: :destroy, foreign_key: 'PostId_id'
  has_many :likes, dependent: :destroy, foreign_key: 'PostId_id'

  validates :Title, :Text, :AuthorId_id, presence: true

  after_save do
    author.increment!(:Posts_Counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
