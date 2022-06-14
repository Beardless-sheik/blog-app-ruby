class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId_id'

  has_many :comments, dependent: :destroy, foreign_key: 'PostId_id'
  has_many :likes, dependent: :destroy, foreign_key: 'PostId_id'

  validates :Text, :AuthorId_id, presence: true
  validates :Title, length: { in: 1..250 }, presence: true, allow_blank: false
  validates_numericality_of :Comments_Counter, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :Likes_Counter, only_integer: true, greater_than_or_equal_to: 0

  after_save do
    author.increment!(:Posts_Counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
