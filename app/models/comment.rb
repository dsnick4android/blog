class Comment < ApplicationRecord
  validates :text, length: { maximum: 3000, minimum: 3 }
  belongs_to :user
  belongs_to :post
end
