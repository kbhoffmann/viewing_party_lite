class Party < ApplicationRecord
  validates :movie_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true

  has_many :user_partys
  has_many :users, through: :user_partys
end
