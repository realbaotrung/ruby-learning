class RemoveProductRefFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :product, foreign_key: true, index: false
  end
end
