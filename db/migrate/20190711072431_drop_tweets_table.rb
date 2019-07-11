class DropTweetsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :tweets
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
