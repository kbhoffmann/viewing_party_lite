class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  has_secure_password

  has_many :user_partys
  has_many :partys, through: :user_partys
end
