class Pool < ApplicationRecord
  belongs_to :user
  has_many :vestings, dependent: :destroy

  validates :project, presence: true, uniqueness: { scope: :user_id }
  validates :amount, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }, allow_nil: true
end
