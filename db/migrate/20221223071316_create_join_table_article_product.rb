class CreateJoinTableArticleProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :articles, :products do |t|
      t.index [:article_id, :product_id]
      # t.index [:product_id, :article_id]
    end
  end
end
