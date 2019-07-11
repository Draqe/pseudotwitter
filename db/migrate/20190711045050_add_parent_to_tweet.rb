class AddParentToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :parent, :reference
  end
end
