class Post < ApplicationRecord
  validates :title, :article, presence: true
  belongs_to :user
end
