class User < ApplicationRecord

  has_many :tweets, dependent: :destroy
  has_many :replies, class_name: 'Reply'
  has_secure_password

  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x

  validates :first_name, :last_name, presence:true
  validates :email, format: {with: /.+@.+\..+/i, message: 'only valid emails allowed'}, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, format: { with: PASSWORD_FORMAT}, on: :create
end
