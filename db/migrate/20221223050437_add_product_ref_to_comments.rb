# To make this run successfully when db:migrate
# make sure that product model is existed like below
# NOTE: Should consider using 'polymorphic'
# === /app/models/product.rb
#   class Product < ApplicationRecord
#     has_many :comments
#   end
# ===
class AddProductRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :product, foreign_key: true
  end
end
