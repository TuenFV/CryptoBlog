class Pool < ApplicationRecord
  belongs_to :user
  has_many :vestings, dependent: :destroy
end
