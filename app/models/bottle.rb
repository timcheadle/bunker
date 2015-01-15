class Bottle < ActiveRecord::Base
  TYPES = %w(bourbon rye scotch)

  validates :name, presence: true
  validates :type, presence: true, inclusion: TYPES
  validates :volume, presence: true, numericality: {
    only_integer: true,
    greater_than: 0
  }
  validates :proof, presence: true, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 200
  }
  validates :released, numericality: {
    only_integer: true,
    greater_than: 1700
  }
  validates :price, numericality: {
    greater_than: 0
  }
  validates :score, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }
end
