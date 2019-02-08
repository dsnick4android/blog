class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :commentable, source_type: :Post
  has_many :commented_users, through: :comments, source: :commentable, source_type: :User

  validates :name, presence: true
  validates :name, length: { maximum: 30, minimum: 2 }
  validates :name, uniqueness: true

  before_destroy :log_before_destroy
  after_destroy  :log_after_destroy

  private

  def log_before_destroy
    Rails.logger.info "###### We are going to destroy user #{@name} ######"
  end

  def log_after_destroy
    Rails.logger.info "###### User #{@name} succesfully destroyed ######"
  end
end
