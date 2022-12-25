class RemoveTestFromColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :test, :string
  end
end
