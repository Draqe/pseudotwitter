class Tweet < ApplicationRecord
	validate :user_id, presence: true
	validate :text, presence: true, length: {maximum: 140}
end
