class AddTypeToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :type, :string
  end
end
