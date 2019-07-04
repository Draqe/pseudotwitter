class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_secure_password
  validates :first_name, :last_name, presence:true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates_length_of :password, :in => 6..20, :on => :create
end
