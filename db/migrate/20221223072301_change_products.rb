class ChangeProducts < ActiveRecord::Migration[7.0]
  def change
    change_table :products do |t|
      t.rename :name, :product_name
      t.boolean :is_available, null: false
    end
  end
end
