class RemoveParentFromTweet < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :parent
  end
end
