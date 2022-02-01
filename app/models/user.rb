class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  has_many :user_partys
  has_many :partys, through: :user_partys
end
