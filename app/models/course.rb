class Course < ApplicationRecord
  self.per_page = 10

  validates :name, presence: true
  belongs_to :user

  has_and_belongs_to_many :books
end
