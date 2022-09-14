class Book < ApplicationRecord
	has_many :reading_times, dependent: :destroy
end
