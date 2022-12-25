class ExampleMigration < ActiveRecord::Migration[7.0]
  def change
    create_table :distributors do |t|
      t.string :zipcode
    end

    add_column :products, :page_url, :string
  end
end
