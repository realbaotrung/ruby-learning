class ChangeCommentsTest < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :comments do |t|
        dir.up { t.change :test, :string }
        dir.down { t.change :test, :integer }
      end
    end
  end
end
