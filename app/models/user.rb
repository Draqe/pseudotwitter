class User < ApplicationRecord
	validates :first_name, :last_name, presence:true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
	validates :password, presence: true, length: {minimum: 8} 
end
