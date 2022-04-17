class TotalRateValidator < ActiveModel::Validator
  def validate(vesting)
    if vesting.id.nil?
      if (vesting.pool.vestings.sum(:rate) + vesting.rate) > 100
        vesting.errors.add :base, "Total vesting rate is over 100%"
      end
    else
    # When commit update, we have rate of old value: Vesting.find(vesting.id).rate and new value: vesting.rate
      if (vesting.pool.vestings.sum(:rate) - Vesting.find(vesting.id).rate + vesting.rate ) > 100
        vesting.errors.add :base, "Total vesting rate is over 100%"
      end
    end
  end
end

class Vesting < ApplicationRecord
  belongs_to :pool

  validates :date, uniqueness: { scope: :pool_id }
  validates :rate, presence: true, numericality: { greater_than: 0}
  validates :soldtoken, :return, numericality: { greater_than: 0}, allow_nil: true
  validates_with TotalRateValidator
end
