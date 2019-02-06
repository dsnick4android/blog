class Post < ApplicationRecord
  validates :title, length: { maximum: 512, minimum: 5 }
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  scope :written_by_moderators, -> { joins(:user).where(users: {moderator: true })}
end
