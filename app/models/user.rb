class User < ApplicationRecord
  has_secure_password
  has_many :messages
  has_many :chatrooms, through: :messages

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
end
