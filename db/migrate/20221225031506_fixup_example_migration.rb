require_relative "20221225023735_example_migration"

# Reverting previous migrations
# using 'revert' method
# first, import migrate's file that has 'ExampleMigration'
# then creating a new apples table
class FixupExampleMigration < ActiveRecord::Migration[7.0]
  def change
    revert ExampleMigration

    create_table(:apples) do |t|
      t.string :variety
    end
  end
end
