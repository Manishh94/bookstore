class User < ApplicationRecord
  self.per_page = 10
  rolify
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, presence: true
  validates :name, presence: true

  has_many :courses, dependent: :destroy
  has_many :reading_times, dependent: :destroy
end
