class User < ApplicationRecord
  self.per_page = 10
  rolify
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, presence: true
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }, presence: true
end
