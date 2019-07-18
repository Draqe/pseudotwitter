class Tweet < ApplicationRecord

  belongs_to :user
  has_many :replies, class_name: 'Tweet'
  validates :text, presence: true, length: {maximum: 140}, format: {message: 'Text cannot be empty and less than 140 characters'}
end
