# command:
#   $ rails g migration CreateProducts name:string part_number:string:index
# also need to create something manually:
#   - app/models/product.rb (Product model)
#   - test/models/product_test.rb
#   - test/fixtures/product.yml
# then run:
#   $ rails db:migrate
# after that, create Products controller by cli:
#   $ rails generate controller Products
class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :part_number

      # this will be created automatically
      # - created_at
      # - updated_at
      t.timestamps
    end
    # Useful for querying and searching performance in database
    add_index :products, :part_number
  end
end
