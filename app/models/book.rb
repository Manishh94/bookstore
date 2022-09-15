class Book < ApplicationRecord
  has_many :reading_times, dependent: :destroy
  has_and_belongs_to_many :courses
end
