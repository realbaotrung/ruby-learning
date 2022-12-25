class ChangeProductsProductName < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :product_name, :string, limit: 255
  end
end
