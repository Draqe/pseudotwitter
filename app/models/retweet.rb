class Retweet < Tweet

  belongs_to :tweet
  belongs_to :user
end
