class Comment < ApplicationRecord
  validates :body, length: { maximum: 3000, minimum: 3 }
  belongs_to :user, counter_cache: true
  belongs_to :commentable, polymorphic: true
end
