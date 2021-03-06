class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'AuthorId_id', dependent: :destroy
  has_many :posts, foreign_key: 'AuthorId_id', dependent: :destroy
  has_many :likes, foreign_key: 'AuthorId_id', dependent: :destroy

  validates :Name, presence: true
  validates_numericality_of :Posts_Counter, only_integer: true, greater_than_or_equal_to: 0

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
