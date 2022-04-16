module PoolsHelper
  def pool_profit(pool)
    profit = 0
    @pool = pool
    pool.vestings.find_each do |vesting|
      profit += vesting.return unless vesting.return.nil?
    end
    pool.amount.nil? ? 0 : (profit - pool.amount).round(0)
  end

  def total_profit(user)
    total = 0
    user.pools.each do |pool|
      total += pool_profit(pool)
    end
    return total
  end
end
