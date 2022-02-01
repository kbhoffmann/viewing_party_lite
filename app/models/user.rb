class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :user_partys
  has_many :partys, through: :user_partys
end
