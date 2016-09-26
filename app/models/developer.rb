class Developer < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 250 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 1, less_than_or_equal_to: 150 }
end
