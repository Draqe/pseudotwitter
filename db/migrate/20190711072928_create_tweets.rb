class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :text
      t.references :user
      t.references :tweet
      t.string :type

      t.timestamps null: false
    end
  end
end
