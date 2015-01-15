class Bottle < ActiveRecord::Base
  SPIRITS = %w(bourbon rye scotch)

  validates :name, presence: true
  validates :spirit, presence: true, inclusion: SPIRITS
  validates :volume, presence: true, numericality: {
    only_integer: true,
    greater_than: 0
  }
  validates :proof, presence: true, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 200
  }
  validates :released, numericality: {
    allow_nil: true,
    only_integer: true,
    greater_than: 1700
  }
  validates :price, numericality: {
    greater_than_or_equal_to: 0
  }
  validates :score, numericality: {
    allow_nil: true,
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }
end
