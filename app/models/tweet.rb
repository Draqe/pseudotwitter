class Tweet < ApplicationRecord
  #validates :user_id, presence: true, numericality: true
  validates :text, presence: true, length: {maximum: 140}
end
