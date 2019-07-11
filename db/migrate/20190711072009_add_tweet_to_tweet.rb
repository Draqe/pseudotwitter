class AddTweetToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :tweet, :reference
  end
end
