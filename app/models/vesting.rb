class Vesting < ApplicationRecord
  belongs_to :pool

  validates :rate, presence: true, numericality: { greater_than: 0}
  validates :soldtoken, :return, numericality: { greater_than: 0}, allow_nil: true
end
