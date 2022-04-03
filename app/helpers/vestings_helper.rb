module VestingsHelper
  def token_recieve(vesting)
    if vesting.pool.price.nil? || vesting.rate.nil?
      return "-"
    else
      total_token = vesting.pool.amount / vesting.pool.price
      return (vesting.rate*total_token/100).round(0)
    end
  end
end
