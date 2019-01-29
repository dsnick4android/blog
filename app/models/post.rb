class Post < ApplicationRecord
  validates :title, length: { maximum: 256, minimum: 5 }
  belongs_to :user
end
