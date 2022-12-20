class Article < ApplicationRecord
  include Visible

  # if delete an article, its associated comments will also need to
  # be deleted, otherwise they would occupy space in the database
  has_many :comments, dependent: :destroy

  # add validations and displaying Error Messages
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
