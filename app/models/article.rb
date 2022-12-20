class Article < ApplicationRecord
  # add validations and displaying Error Messages
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
