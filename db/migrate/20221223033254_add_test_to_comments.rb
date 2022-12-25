class AddTestToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :test, :string
  end
end
