class User < ApplicationRecord

  has_many :tweets, dependent: :destroy
  has_many :replies, class_name: 'Reply'
  has_secure_password

  password_format = /\A
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
  /x

  validates :first_name, :last_name, presence:true
  validates :email, format: {with: /.+@.+\..+/i, message: 'only valid emails allowed'}, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, format: { with: password_format, message: 'Password requires 1 capital letter, 1 number, and 1 special character' }, on: :create
end
