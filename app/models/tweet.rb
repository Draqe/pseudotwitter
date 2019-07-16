class Tweet < ApplicationRecord

  belongs_to :user
  has_many :replies, class_name: "Tweet"
  validates :text, presence: true, length: {maximum: 140}
end
