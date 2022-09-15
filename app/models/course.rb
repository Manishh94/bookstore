class Course < ApplicationRecord
  self.per_page = 10

  validates :name, presence: true

  belongs_to :user

  has_and_belongs_to_many :books

  has_many :reading_times, through: :books
  has_many :students, through: :books
  
end
